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
import 'dashboard.dart' as _i3;
import 'dashboard_widget.dart' as _i4;
import 'device.dart' as _i5;
import 'device_field.dart' as _i6;
import 'device_log.dart' as _i7;
import 'example.dart' as _i8;
import 'field_type.dart' as _i9;
import 'widget_type.dart' as _i10;
import 'protocol.dart' as _i11;
export 'dashboard.dart';
export 'dashboard_widget.dart';
export 'device.dart';
export 'device_field.dart';
export 'device_log.dart';
export 'example.dart';
export 'field_type.dart';
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
      ],
      foreignKeys: [],
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
          name: 'datasource',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'protocol:Device',
        ),
        _i2.ColumnDefinition(
          name: 'fields',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'type',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:WidgetType',
          columnDefault: '\'text\'::text',
        ),
        _i2.ColumnDefinition(
          name: 'points',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '360',
        ),
        _i2.ColumnDefinition(
          name: 'dashboardId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'dashboard_widget_fk_0',
          columns: ['dashboardId'],
          referenceTable: 'dashboard',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
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
          name: 'created',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [],
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
      name: 'device_fields',
      dartName: 'DeviceFields',
      schema: 'public',
      module: 'zeal4',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'device_fields_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'field',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'type',
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
          constraintName: 'device_fields_fk_0',
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
          indexName: 'device_fields_pkey',
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
    ..._i2.Protocol.targetTableDefinitions,
  ];

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i3.Dashboard) {
      return _i3.Dashboard.fromJson(data) as T;
    }
    if (t == _i4.DashboardWidget) {
      return _i4.DashboardWidget.fromJson(data) as T;
    }
    if (t == _i5.Device) {
      return _i5.Device.fromJson(data) as T;
    }
    if (t == _i6.DeviceFields) {
      return _i6.DeviceFields.fromJson(data) as T;
    }
    if (t == _i7.DeviceLog) {
      return _i7.DeviceLog.fromJson(data) as T;
    }
    if (t == _i8.Example) {
      return _i8.Example.fromJson(data) as T;
    }
    if (t == _i9.FieldType) {
      return _i9.FieldType.fromJson(data) as T;
    }
    if (t == _i10.WidgetType) {
      return _i10.WidgetType.fromJson(data) as T;
    }
    if (t == _i1.getType<_i3.Dashboard?>()) {
      return (data != null ? _i3.Dashboard.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.DashboardWidget?>()) {
      return (data != null ? _i4.DashboardWidget.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Device?>()) {
      return (data != null ? _i5.Device.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.DeviceFields?>()) {
      return (data != null ? _i6.DeviceFields.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.DeviceLog?>()) {
      return (data != null ? _i7.DeviceLog.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.Example?>()) {
      return (data != null ? _i8.Example.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.FieldType?>()) {
      return (data != null ? _i9.FieldType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.WidgetType?>()) {
      return (data != null ? _i10.WidgetType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<_i11.DashboardWidget>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i11.DashboardWidget>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i11.DeviceFields>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i11.DeviceFields>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i11.DeviceLog>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i11.DeviceLog>(e)).toList()
          : null) as dynamic;
    }
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i3.Dashboard) {
      return 'Dashboard';
    }
    if (data is _i4.DashboardWidget) {
      return 'DashboardWidget';
    }
    if (data is _i5.Device) {
      return 'Device';
    }
    if (data is _i6.DeviceFields) {
      return 'DeviceFields';
    }
    if (data is _i7.DeviceLog) {
      return 'DeviceLog';
    }
    if (data is _i8.Example) {
      return 'Example';
    }
    if (data is _i9.FieldType) {
      return 'FieldType';
    }
    if (data is _i10.WidgetType) {
      return 'WidgetType';
    }
    className = _i2.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'Dashboard') {
      return deserialize<_i3.Dashboard>(data['data']);
    }
    if (data['className'] == 'DashboardWidget') {
      return deserialize<_i4.DashboardWidget>(data['data']);
    }
    if (data['className'] == 'Device') {
      return deserialize<_i5.Device>(data['data']);
    }
    if (data['className'] == 'DeviceFields') {
      return deserialize<_i6.DeviceFields>(data['data']);
    }
    if (data['className'] == 'DeviceLog') {
      return deserialize<_i7.DeviceLog>(data['data']);
    }
    if (data['className'] == 'Example') {
      return deserialize<_i8.Example>(data['data']);
    }
    if (data['className'] == 'FieldType') {
      return deserialize<_i9.FieldType>(data['data']);
    }
    if (data['className'] == 'WidgetType') {
      return deserialize<_i10.WidgetType>(data['data']);
    }
    if (data['className'].startsWith('serverpod.')) {
      data['className'] = data['className'].substring(10);
      return _i2.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i3.Dashboard:
        return _i3.Dashboard.t;
      case _i4.DashboardWidget:
        return _i4.DashboardWidget.t;
      case _i5.Device:
        return _i5.Device.t;
      case _i6.DeviceFields:
        return _i6.DeviceFields.t;
      case _i7.DeviceLog:
        return _i7.DeviceLog.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'zeal4';
}
