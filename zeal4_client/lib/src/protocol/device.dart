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

abstract class Device implements _i1.SerializableModel {
  Device._({
    this.id,
    required this.uuid,
    required this.name,
    required this.description,
    this.fields,
    DateTime? created,
    this.deviceLog,
  }) : created = created ?? DateTime.now();

  factory Device({
    int? id,
    required String uuid,
    required String name,
    required String description,
    List<_i2.DeviceFields>? fields,
    DateTime? created,
    List<_i2.DeviceLog>? deviceLog,
  }) = _DeviceImpl;

  factory Device.fromJson(Map<String, dynamic> jsonSerialization) {
    return Device(
      id: jsonSerialization['id'] as int?,
      uuid: jsonSerialization['uuid'] as String,
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String,
      fields: (jsonSerialization['fields'] as List?)
          ?.map((e) => _i2.DeviceFields.fromJson((e as Map<String, dynamic>)))
          .toList(),
      created: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['created']),
      deviceLog: (jsonSerialization['deviceLog'] as List?)
          ?.map((e) => _i2.DeviceLog.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String uuid;

  String name;

  String description;

  List<_i2.DeviceFields>? fields;

  DateTime created;

  List<_i2.DeviceLog>? deviceLog;

  Device copyWith({
    int? id,
    String? uuid,
    String? name,
    String? description,
    List<_i2.DeviceFields>? fields,
    DateTime? created,
    List<_i2.DeviceLog>? deviceLog,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'uuid': uuid,
      'name': name,
      'description': description,
      if (fields != null)
        'fields': fields?.toJson(valueToJson: (v) => v.toJson()),
      'created': created.toJson(),
      if (deviceLog != null)
        'deviceLog': deviceLog?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DeviceImpl extends Device {
  _DeviceImpl({
    int? id,
    required String uuid,
    required String name,
    required String description,
    List<_i2.DeviceFields>? fields,
    DateTime? created,
    List<_i2.DeviceLog>? deviceLog,
  }) : super._(
          id: id,
          uuid: uuid,
          name: name,
          description: description,
          fields: fields,
          created: created,
          deviceLog: deviceLog,
        );

  @override
  Device copyWith({
    Object? id = _Undefined,
    String? uuid,
    String? name,
    String? description,
    Object? fields = _Undefined,
    DateTime? created,
    Object? deviceLog = _Undefined,
  }) {
    return Device(
      id: id is int? ? id : this.id,
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      description: description ?? this.description,
      fields: fields is List<_i2.DeviceFields>?
          ? fields
          : this.fields?.map((e0) => e0.copyWith()).toList(),
      created: created ?? this.created,
      deviceLog: deviceLog is List<_i2.DeviceLog>?
          ? deviceLog
          : this.deviceLog?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
