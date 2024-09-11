/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'protocol.dart' as _i2;

abstract class DeviceLog implements _i1.SerializableModel {
  DeviceLog._({
    this.id,
    DateTime? created,
    required this.message,
    required this.deviceId,
    this.device,
  }) : created = created ?? DateTime.now();

  factory DeviceLog({
    int? id,
    DateTime? created,
    required String message,
    required int deviceId,
    _i2.Device? device,
  }) = _DeviceLogImpl;

  factory DeviceLog.fromJson(Map<String, dynamic> jsonSerialization) {
    return DeviceLog(
      id: jsonSerialization['id'] as int?,
      created: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['created']),
      message: jsonSerialization['message'] as String,
      deviceId: jsonSerialization['deviceId'] as int,
      device: jsonSerialization['device'] == null
          ? null
          : _i2.Device.fromJson(
              (jsonSerialization['device'] as Map<String, dynamic>)),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  DateTime created;

  String message;

  int deviceId;

  _i2.Device? device;

  DeviceLog copyWith({
    int? id,
    DateTime? created,
    String? message,
    int? deviceId,
    _i2.Device? device,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'created': created.toJson(),
      'message': message,
      'deviceId': deviceId,
      if (device != null) 'device': device?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DeviceLogImpl extends DeviceLog {
  _DeviceLogImpl({
    int? id,
    DateTime? created,
    required String message,
    required int deviceId,
    _i2.Device? device,
  }) : super._(
          id: id,
          created: created,
          message: message,
          deviceId: deviceId,
          device: device,
        );

  @override
  DeviceLog copyWith({
    Object? id = _Undefined,
    DateTime? created,
    String? message,
    int? deviceId,
    Object? device = _Undefined,
  }) {
    return DeviceLog(
      id: id is int? ? id : this.id,
      created: created ?? this.created,
      message: message ?? this.message,
      deviceId: deviceId ?? this.deviceId,
      device: device is _i2.Device? ? device : this.device?.copyWith(),
    );
  }
}
