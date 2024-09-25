import 'dart:convert';

import 'package:serverpod/serverpod.dart';
import 'package:zeal4_server/src/generated/protocol.dart';

// This is an example endpoint of your server. It's best practice to use the
// `Endpoint` ending of the class name, but it will be removed when accessing
// the endpoint from the client. I.e., this endpoint can be accessed through
// `client.example` on the client side.

// After adding or modifying an endpoint, you will need to run
// `serverpod generate` to update the server and client code.
class DevicelogEndpoint extends Endpoint {
  // You create methods in your endpoint which are accessible from the client by
  // creating a public method with `Session` as its first parameter.
  // `bool`, `int`, `double`, `String`, `UuidValue`, `Duration`, `DateTime`, `ByteData`,
  // and other serializable classes, exceptions and enums from your from your `protocol` directory.
  // The methods should return a typed future; the same types as for the parameters are
  // supported. The `session` object provides access to the database, logging,
  // passwords, and information about the request being made to the server.

  // Future<String> hello(Session session, String name) async {
  //   return 'Hello $name';
  // }

  // FIXME : should check a privilege to insert data to database

  // add device log
  Future<DeviceLog?> addDeivceLog(
      Session session, String uuid, String message) async {
    // find device
    final devices = await Device.db.find(
      session,
      where: (p) => (p.uuid.equals(uuid)),
    );

    if (devices.isNotEmpty) {
      final device = devices.first;
      final jsonData = jsonDecode(message);
      final timeStamp = double.parse('${jsonData['timestamp'] * 1000}').toInt();
      final created = DateTime.fromMillisecondsSinceEpoch(timeStamp);
      final row = DeviceLog(
        message: message,
        deviceId: device.id!,
        created: created,
      );

      // send message to message central
      session.messages.postMessage('channel_${device.id}', row);

      // save data to database
      return await DeviceLog.db.insertRow(session, row);
    } else {
      return null;
    }
  }

  // Method 1 : push stream device log to client
  Stream<SnapshotDeviceLog> streamInfinitDeviceLog(
      Session session, int deviceId, int total, bool desc) async* {
    while (true) {
      List<DeviceLog> logs = await DeviceLog.db.find(
        session,
        where: (p) => (p.deviceId.equals(deviceId)),
        limit: total,
        orderBy: (p) => (p.created),
        orderDescending: desc,
      );

      yield SnapshotDeviceLog(devicelogs: logs);

      Future.delayed(Duration(seconds: 10));
    }
  }

  // Method 2 : stream device log as a Serializable object
  Stream<SnapshotDeviceLog> streamDeviceLog(
      Session session, int deviceId, int total, bool desc) async* {
    List<DeviceLog> logs = await DeviceLog.db.find(
      session,
      where: (p) => (p.deviceId.equals(deviceId)),
      limit: total,
      orderBy: (p) => (p.created),
      orderDescending: desc,
    );

    yield SnapshotDeviceLog(devicelogs: logs);
  }

  // Method 3 : Stream only data points and use periodic timer to featch data from client
  Stream<DeviceLog> streamDeviceLogDataPoints(
      Session session, int deviceId, int total, bool desc) async* {
    List<DeviceLog> logs = await DeviceLog.db.find(
      session,
      where: (p) => (p.deviceId.equals(deviceId)),
      limit: total,
      orderBy: (p) => (p.created),
      orderDescending: desc,
    );

    for (var log in logs) {
      yield log;
    }
  }

  // Method 4 : return future list of devicelog
  Future<List<DeviceLog>> getDeviceLog(
      Session session, int deviceId, int total, bool desc) async {
    List<DeviceLog> logs = await DeviceLog.db.find(
      session,
      where: (p) => (p.deviceId.equals(deviceId)),
      limit: total,
      orderBy: (p) => (p.created),
      orderDescending: desc,
    );

    return logs;
  }

  // Method 5
  Stream deviceLogMessage(
      Session session, int deviceId, int total, bool desc) async* {
    var messageStream =
        session.messages.createStream<DeviceLog>('channel_$deviceId');

    List<DeviceLog> logs = await DeviceLog.db.find(
      session,
      where: (p) => (p.deviceId.equals(deviceId)),
      limit: total,
      orderBy: (p) => (p.created),
      orderDescending: desc,
    );

    yield SnapshotDeviceLog(devicelogs: logs);

    await for (var message in messageStream) {
      yield message;
    }
  }
}
