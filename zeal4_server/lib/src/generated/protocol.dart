/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod/protocol.dart' as _i2;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i3;
import 'dashboard.dart' as _i4;
import 'device.dart' as _i5;
import 'device_log.dart' as _i6;
import 'example.dart' as _i7;
import 'snapshot_devicelog.dart' as _i8;
import 'user_scope.dart' as _i9;
import 'widget.dart' as _i10;
import 'widget_type.dart' as _i11;
import 'protocol.dart' as _i12;
import 'package:zeal4_server/src/generated/dashboard.dart' as _i13;
import 'package:zeal4_server/src/generated/device_log.dart' as _i14;
export 'dashboard.dart';
export 'device.dart';
export 'device_log.dart';
export 'example.dart';
export 'snapshot_devicelog.dart';
export 'user_scope.dart';
export 'widget.dart';
export 'widget_type.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'dashboard',
      dartName: 'Dashboard',
      schema: 'public',
      module: 'zeal4',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'dashboard_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'userInfoId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'dashboard_fk_0',
          columns: ['userInfoId'],
          referenceTable: 'serverpod_user_info',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.setNull,
          onDelete: _i2.ForeignKeyAction.setNull,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'dashboard_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'dashboard_widget',
      dartName: 'DashboardWidget',
      schema: 'public',
      module: 'zeal4',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'dashboard_widget_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'width',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '3',
        ),
        _i2.ColumnDefinition(
          name: 'height',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '1',
        ),
        _i2.ColumnDefinition(
          name: 'order',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '1',
        ),
        _i2.ColumnDefinition(
          name: 'deviceId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'fields',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<String>',
        ),
        _i2.ColumnDefinition(
          name: 'units',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<String>',
        ),
        _i2.ColumnDefinition(
          name: 'type',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:WidgetType',
          columnDefault: '\'text\'::text',
        ),
        _i2.ColumnDefinition(
          name: 'labels',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<String>',
        ),
        _i2.ColumnDefinition(
          name: 'points',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '60',
        ),
        _i2.ColumnDefinition(
          name: 'dashboardId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'userInfoId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'enable',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'dashboard_widget_fk_0',
          columns: ['deviceId'],
          referenceTable: 'device',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'dashboard_widget_fk_1',
          columns: ['dashboardId'],
          referenceTable: 'dashboard',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'dashboard_widget_fk_2',
          columns: ['userInfoId'],
          referenceTable: 'serverpod_user_info',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.setNull,
          onDelete: _i2.ForeignKeyAction.setNull,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'dashboard_widget_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'device',
      dartName: 'Device',
      schema: 'public',
      module: 'zeal4',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'device_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'uuid',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'fields',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'List<String>?',
        ),
        _i2.ColumnDefinition(
          name: 'userInfoId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'created',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'device_fk_0',
          columns: ['userInfoId'],
          referenceTable: 'serverpod_user_info',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.setNull,
          onDelete: _i2.ForeignKeyAction.setNull,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'device_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'device_log',
      dartName: 'DeviceLog',
      schema: 'public',
      module: 'zeal4',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'device_log_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'created',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'message',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'deviceId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'device_log_fk_0',
          columns: ['deviceId'],
          referenceTable: 'device',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'device_log_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    ..._i3.Protocol.targetTableDefinitions,
    ..._i2.Protocol.targetTableDefinitions,
  ];

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i4.Dashboard) {
      return _i4.Dashboard.fromJson(data) as T;
    }
    if (t == _i5.Device) {
      return _i5.Device.fromJson(data) as T;
    }
    if (t == _i6.DeviceLog) {
      return _i6.DeviceLog.fromJson(data) as T;
    }
    if (t == _i7.Example) {
      return _i7.Example.fromJson(data) as T;
    }
    if (t == _i8.SnapshotDeviceLog) {
      return _i8.SnapshotDeviceLog.fromJson(data) as T;
    }
    if (t == _i9.UserScope) {
      return _i9.UserScope.fromJson(data) as T;
    }
    if (t == _i10.DashboardWidget) {
      return _i10.DashboardWidget.fromJson(data) as T;
    }
    if (t == _i11.WidgetType) {
      return _i11.WidgetType.fromJson(data) as T;
    }
    if (t == _i1.getType<_i4.Dashboard?>()) {
      return (data != null ? _i4.Dashboard.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Device?>()) {
      return (data != null ? _i5.Device.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.DeviceLog?>()) {
      return (data != null ? _i6.DeviceLog.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Example?>()) {
      return (data != null ? _i7.Example.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.SnapshotDeviceLog?>()) {
      return (data != null ? _i8.SnapshotDeviceLog.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.UserScope?>()) {
      return (data != null ? _i9.UserScope.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.DashboardWidget?>()) {
      return (data != null ? _i10.DashboardWidget.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.WidgetType?>()) {
      return (data != null ? _i11.WidgetType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<_i12.DashboardWidget>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i12.DashboardWidget>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i12.DashboardWidget>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i12.DashboardWidget>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i12.DeviceLog>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i12.DeviceLog>(e)).toList()
          : null) as dynamic;
    }
    if (t == List<_i12.DeviceLog>) {
      return (data as List).map((e) => deserialize<_i12.DeviceLog>(e)).toList()
          as dynamic;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList()
          as dynamic;
    }
    if (t == List<_i13.Dashboard>) {
      return (data as List).map((e) => deserialize<_i13.Dashboard>(e)).toList()
          as dynamic;
    }
    if (t == List<_i14.DeviceLog>) {
      return (data as List).map((e) => deserialize<_i14.DeviceLog>(e)).toList()
          as dynamic;
    }
    try {
      return _i3.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i4.Dashboard) {
      return 'Dashboard';
    }
    if (data is _i5.Device) {
      return 'Device';
    }
    if (data is _i6.DeviceLog) {
      return 'DeviceLog';
    }
    if (data is _i7.Example) {
      return 'Example';
    }
    if (data is _i8.SnapshotDeviceLog) {
      return 'SnapshotDeviceLog';
    }
    if (data is _i9.UserScope) {
      return 'UserScope';
    }
    if (data is _i10.DashboardWidget) {
      return 'DashboardWidget';
    }
    if (data is _i11.WidgetType) {
      return 'WidgetType';
    }
    className = _i2.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod.$className';
    }
    className = _i3.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'Dashboard') {
      return deserialize<_i4.Dashboard>(data['data']);
    }
    if (data['className'] == 'Device') {
      return deserialize<_i5.Device>(data['data']);
    }
    if (data['className'] == 'DeviceLog') {
      return deserialize<_i6.DeviceLog>(data['data']);
    }
    if (data['className'] == 'Example') {
      return deserialize<_i7.Example>(data['data']);
    }
    if (data['className'] == 'SnapshotDeviceLog') {
      return deserialize<_i8.SnapshotDeviceLog>(data['data']);
    }
    if (data['className'] == 'UserScope') {
      return deserialize<_i9.UserScope>(data['data']);
    }
    if (data['className'] == 'DashboardWidget') {
      return deserialize<_i10.DashboardWidget>(data['data']);
    }
    if (data['className'] == 'WidgetType') {
      return deserialize<_i11.WidgetType>(data['data']);
    }
    if (data['className'].startsWith('serverpod.')) {
      data['className'] = data['className'].substring(10);
      return _i2.Protocol().deserializeByClassName(data);
    }
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i3.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i3.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i4.Dashboard:
        return _i4.Dashboard.t;
      case _i5.Device:
        return _i5.Device.t;
      case _i6.DeviceLog:
        return _i6.DeviceLog.t;
      case _i10.DashboardWidget:
        return _i10.DashboardWidget.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'zeal4';
}
