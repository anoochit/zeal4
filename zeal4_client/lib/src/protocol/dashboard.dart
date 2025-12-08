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
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i3;
import 'package:zeal4_client/src/protocol/protocol.dart' as _i4;

abstract class Dashboard implements _i1.SerializableModel {
  Dashboard._({
    this.id,
    required this.name,
    required this.description,
    this.widget,
    required this.userInfoId,
    this.userInfo,
  });

  factory Dashboard({
    int? id,
    required String name,
    required String description,
    List<_i2.DashboardWidget>? widget,
    required int userInfoId,
    _i3.UserInfo? userInfo,
  }) = _DashboardImpl;

  factory Dashboard.fromJson(Map<String, dynamic> jsonSerialization) {
    return Dashboard(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String,
      widget: jsonSerialization['widget'] == null
          ? null
          : _i4.Protocol().deserialize<List<_i2.DashboardWidget>>(
              jsonSerialization['widget'],
            ),
      userInfoId: jsonSerialization['userInfoId'] as int,
      userInfo: jsonSerialization['userInfo'] == null
          ? null
          : _i4.Protocol().deserialize<_i3.UserInfo>(
              jsonSerialization['userInfo'],
            ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  String description;

  List<_i2.DashboardWidget>? widget;

  int userInfoId;

  _i3.UserInfo? userInfo;

  /// Returns a shallow copy of this [Dashboard]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Dashboard copyWith({
    int? id,
    String? name,
    String? description,
    List<_i2.DashboardWidget>? widget,
    int? userInfoId,
    _i3.UserInfo? userInfo,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Dashboard',
      if (id != null) 'id': id,
      'name': name,
      'description': description,
      if (widget != null)
        'widget': widget?.toJson(valueToJson: (v) => v.toJson()),
      'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DashboardImpl extends Dashboard {
  _DashboardImpl({
    int? id,
    required String name,
    required String description,
    List<_i2.DashboardWidget>? widget,
    required int userInfoId,
    _i3.UserInfo? userInfo,
  }) : super._(
         id: id,
         name: name,
         description: description,
         widget: widget,
         userInfoId: userInfoId,
         userInfo: userInfo,
       );

  /// Returns a shallow copy of this [Dashboard]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Dashboard copyWith({
    Object? id = _Undefined,
    String? name,
    String? description,
    Object? widget = _Undefined,
    int? userInfoId,
    Object? userInfo = _Undefined,
  }) {
    return Dashboard(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      widget: widget is List<_i2.DashboardWidget>?
          ? widget
          : this.widget?.map((e0) => e0.copyWith()).toList(),
      userInfoId: userInfoId ?? this.userInfoId,
      userInfo: userInfo is _i3.UserInfo?
          ? userInfo
          : this.userInfo?.copyWith(),
    );
  }
}
