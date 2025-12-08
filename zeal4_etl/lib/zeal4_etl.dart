import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:zeal4_client/zeal4_client.dart';
import 'dart:convert';

const mqttHost = 'localhost';
const serverPodHost = 'http://localhost:8080/';

late MqttServerClient mqtt;
MqttClientConnectionStatus? status;
Client client = Client(serverPodHost); // Removed onFailedCall

// handle subscribe
runETL() async {
  // mqtt client id
  final clientId = 'ClientId-${DateTime.now().microsecondsSinceEpoch}';

  // Check Serverpod connection
  final isServerpodConnected = await _checkServerpodConnection();
  if (!isServerpodConnected) {
    print('> Exiting ETL due to Serverpod connection failure.');
    return; // Exit if connection fails
  }

  // connect, subscribe and push message to serverpod
  try {
    // connect to mqtt broker
    mqtt = MqttServerClient(
      mqttHost,
      clientId,
      maxConnectionAttempts: 10,
    )..autoReconnect = true;

    // set callback onsubscribed
    mqtt.onSubscribed = onSubscribed;
    // connect to mqtt broker
    status = await mqtt.connect();
    print('> connection status : ${status!.state.name}');
    // if connected then subcscribe
    if (status!.state == MqttConnectionState.connected) {
      // subscribe /device/+/msg ,a single level wildcard
      print('> start subscribe');
      mqtt.subscribe(
        '/device/+/msg',
        MqttQos.atMostOnce,
      );
      mqtt.subscribe(
        'tele/+/SENSOR',
        MqttQos.atMostOnce,
      );
      // result stream data from mqtt broker
      mqtt.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? data) {
        final recMess = data![0].payload as MqttPublishMessage;
        final topic = data[0].topic;
        final message = MqttPublishPayload.bytesToStringAsString(
          recMess.payload.message,
        );
        // print payload
        print('> topic : $topic\n> payload : $message');

        // get device id from topic /device/+/msg
        RegExp regExp = RegExp(r'/device/([^/]+)/msg');
        Match? match = regExp.firstMatch(topic);

        if (match != null) {
          final uuid = match.group(1)!;
          print('> zeal-device: $uuid');

          // add zeal-device device log
          try {
            client.devicelog.addDeivceLog(uuid, message);
            print('> zeal-message: $message');
          } catch (e) {
            print('> $e');
          }
        } else {
          RegExp tasmotaRegExp = RegExp(r'tele/([^/]+)/SENSOR');
          Match? tasmotaMatch = tasmotaRegExp.firstMatch(topic);
          if (tasmotaMatch != null) {
            // add tasmota-device device log
            final deviceId = tasmotaMatch.group(1)!;
            print('> tasmota-device: $deviceId');

            Map<String, dynamic> parsedMessage;
            try {
              parsedMessage = json.decode(message) as Map<String, dynamic>;

              String? sensorId;
              Map<String, dynamic>? sensorData;
              String? timeString = parsedMessage['Time'] as String?;

              parsedMessage.forEach((key, value) {
                if (key != 'Time') {
                  sensorId = key;
                  sensorData = value as Map<String, dynamic>;
                }
              });

              if (sensorId != null && sensorData != null) {
                if (timeString != null) {
                  try {
                    final dateTime = DateTime.parse(timeString);
                    final timestamp = dateTime.millisecondsSinceEpoch ~/ 1000;
                    sensorData!['timestamp'] = timestamp;
                  } catch (e) {
                    print('> Error parsing time: $e');
                  }
                }

                final combinedId = '${deviceId}_$sensorId';
                final messageToRecord = json.encode(sensorData);

                try {
                  client.devicelog.addDeivceLog(combinedId, messageToRecord);
                  print('> tasmota-device ($combinedId): $messageToRecord');
                } catch (e) {
                  print('$e');
                }
              } else {
                print('> Could not extract sensor data from message: $message');
              }
            } catch (e) {
              print('> Error parsing JSON message: $e');
              return;
            }
          } else {
            print('> No match found.');
          }
        }
      });
    }
  } catch (e) {
    print('$e');
  }
}

// on subscribed
void onSubscribed(String topic) {
  print('> subscription confirmed for topic $topic');
}

Future<bool> _checkServerpodConnection() async {
  print('> Checking Serverpod connection...');
  try {
    final result = await client.example.hello("HealthCheck");
    if (result == "Hello HealthCheck") {
      print('> Serverpod connection successful!');
      return true;
    } else {
      print('> Serverpod connection failed: Unexpected response from hello endpoint: $result');
      return false;
    }
  } catch (e) {
    print('> Serverpod connection failed: $e');
    return false;
  }
}
