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

abstract class DeviceFields implements _i1.SerializableModel {
  DeviceFields._({
    this.id,
    required this.field,
    required this.type,
    required this.deviceId,
    this.device,
  });

  factory DeviceFields({
    int? id,
    required String field,
    required String type,
    required int deviceId,
    _i2.Device? device,
  }) = _DeviceFieldsImpl;

  factory DeviceFields.fromJson(Map<String, dynamic> jsonSerialization) {
    return DeviceFields(
      id: jsonSerialization['id'] as int?,
      field: jsonSerialization['field'] as String,
      type: jsonSerialization['type'] as String,
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

  String field;

  String type;

  int deviceId;

  _i2.Device? device;

  DeviceFields copyWith({
    int? id,
    String? field,
    String? type,
    int? deviceId,
    _i2.Device? device,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'field': field,
      'type': type,
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

class _DeviceFieldsImpl extends DeviceFields {
  _DeviceFieldsImpl({
    int? id,
    required String field,
    required String type,
    required int deviceId,
    _i2.Device? device,
  }) : super._(
          id: id,
          field: field,
          type: type,
          deviceId: deviceId,
          device: device,
        );

  @override
  DeviceFields copyWith({
    Object? id = _Undefined,
    String? field,
    String? type,
    int? deviceId,
    Object? device = _Undefined,
  }) {
    return DeviceFields(
      id: id is int? ? id : this.id,
      field: field ?? this.field,
      type: type ?? this.type,
      deviceId: deviceId ?? this.deviceId,
      device: device is _i2.Device? ? device : this.device?.copyWith(),
    );
  }
}
