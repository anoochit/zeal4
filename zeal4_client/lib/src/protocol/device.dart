/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'widget.dart' as _i2;
import 'device_log.dart' as _i3;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i4;
import 'package:zeal4_client/src/protocol/protocol.dart' as _i5;

abstract class Device implements _i1.SerializableModel {
  Device._({
    this.id,
    required this.uuid,
    required this.name,
    required this.description,
    this.fields,
    this.widget,
    this.deviceLog,
    required this.userInfoId,
    this.userInfo,
    DateTime? created,
  }) : created = created ?? DateTime.now();

  factory Device({
    int? id,
    required String uuid,
    required String name,
    required String description,
    List<String>? fields,
    List<_i2.DashboardWidget>? widget,
    List<_i3.DeviceLog>? deviceLog,
    required int userInfoId,
    _i4.UserInfo? userInfo,
    DateTime? created,
  }) = _DeviceImpl;

  factory Device.fromJson(Map<String, dynamic> jsonSerialization) {
    return Device(
      id: jsonSerialization['id'] as int?,
      uuid: jsonSerialization['uuid'] as String,
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String,
      fields: jsonSerialization['fields'] == null
          ? null
          : _i5.Protocol().deserialize<List<String>>(
              jsonSerialization['fields'],
            ),
      widget: jsonSerialization['widget'] == null
          ? null
          : _i5.Protocol().deserialize<List<_i2.DashboardWidget>>(
              jsonSerialization['widget'],
            ),
      deviceLog: jsonSerialization['deviceLog'] == null
          ? null
          : _i5.Protocol().deserialize<List<_i3.DeviceLog>>(
              jsonSerialization['deviceLog'],
            ),
      userInfoId: jsonSerialization['userInfoId'] as int,
      userInfo: jsonSerialization['userInfo'] == null
          ? null
          : _i5.Protocol().deserialize<_i4.UserInfo>(
              jsonSerialization['userInfo'],
            ),
      created: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['created']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String uuid;

  String name;

  String description;

  List<String>? fields;

  List<_i2.DashboardWidget>? widget;

  List<_i3.DeviceLog>? deviceLog;

  int userInfoId;

  _i4.UserInfo? userInfo;

  DateTime created;

  /// Returns a shallow copy of this [Device]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Device copyWith({
    int? id,
    String? uuid,
    String? name,
    String? description,
    List<String>? fields,
    List<_i2.DashboardWidget>? widget,
    List<_i3.DeviceLog>? deviceLog,
    int? userInfoId,
    _i4.UserInfo? userInfo,
    DateTime? created,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Device',
      if (id != null) 'id': id,
      'uuid': uuid,
      'name': name,
      'description': description,
      if (fields != null) 'fields': fields?.toJson(),
      if (widget != null)
        'widget': widget?.toJson(valueToJson: (v) => v.toJson()),
      if (deviceLog != null)
        'deviceLog': deviceLog?.toJson(valueToJson: (v) => v.toJson()),
      'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJson(),
      'created': created.toJson(),
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
    List<String>? fields,
    List<_i2.DashboardWidget>? widget,
    List<_i3.DeviceLog>? deviceLog,
    required int userInfoId,
    _i4.UserInfo? userInfo,
    DateTime? created,
  }) : super._(
         id: id,
         uuid: uuid,
         name: name,
         description: description,
         fields: fields,
         widget: widget,
         deviceLog: deviceLog,
         userInfoId: userInfoId,
         userInfo: userInfo,
         created: created,
       );

  /// Returns a shallow copy of this [Device]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Device copyWith({
    Object? id = _Undefined,
    String? uuid,
    String? name,
    String? description,
    Object? fields = _Undefined,
    Object? widget = _Undefined,
    Object? deviceLog = _Undefined,
    int? userInfoId,
    Object? userInfo = _Undefined,
    DateTime? created,
  }) {
    return Device(
      id: id is int? ? id : this.id,
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      description: description ?? this.description,
      fields: fields is List<String>?
          ? fields
          : this.fields?.map((e0) => e0).toList(),
      widget: widget is List<_i2.DashboardWidget>?
          ? widget
          : this.widget?.map((e0) => e0.copyWith()).toList(),
      deviceLog: deviceLog is List<_i3.DeviceLog>?
          ? deviceLog
          : this.deviceLog?.map((e0) => e0.copyWith()).toList(),
      userInfoId: userInfoId ?? this.userInfoId,
      userInfo: userInfo is _i4.UserInfo?
          ? userInfo
          : this.userInfo?.copyWith(),
      created: created ?? this.created,
    );
  }
}
