/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'protocol.dart' as _i2;

abstract class DashboardWidget extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  DashboardWidget._({
    int? id,
    required this.name,
    required this.description,
    int? width,
    int? height,
    int? order,
    required this.deviceId,
    this.device,
    required this.fields,
    required this.units,
    _i2.WidgetType? type,
    required this.labels,
    int? points,
    required this.dashboardId,
    this.dashboard,
    bool? enable,
  })  : width = width ?? 3,
        height = height ?? 1,
        order = order ?? 1,
        type = type ?? _i2.WidgetType.text,
        points = points ?? 60,
        enable = enable ?? false,
        super(id);

  factory DashboardWidget({
    int? id,
    required String name,
    required String description,
    int? width,
    int? height,
    int? order,
    required int deviceId,
    _i2.Device? device,
    required List<String> fields,
    required List<String> units,
    _i2.WidgetType? type,
    required List<String> labels,
    int? points,
    required int dashboardId,
    _i2.Dashboard? dashboard,
    bool? enable,
  }) = _DashboardWidgetImpl;

  factory DashboardWidget.fromJson(Map<String, dynamic> jsonSerialization) {
    return DashboardWidget(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String,
      width: jsonSerialization['width'] as int,
      height: jsonSerialization['height'] as int,
      order: jsonSerialization['order'] as int,
      deviceId: jsonSerialization['deviceId'] as int,
      device: jsonSerialization['device'] == null
          ? null
          : _i2.Device.fromJson(
              (jsonSerialization['device'] as Map<String, dynamic>)),
      fields: (jsonSerialization['fields'] as List)
          .map((e) => e as String)
          .toList(),
      units:
          (jsonSerialization['units'] as List).map((e) => e as String).toList(),
      type: _i2.WidgetType.fromJson((jsonSerialization['type'] as String)),
      labels: (jsonSerialization['labels'] as List)
          .map((e) => e as String)
          .toList(),
      points: jsonSerialization['points'] as int,
      dashboardId: jsonSerialization['dashboardId'] as int,
      dashboard: jsonSerialization['dashboard'] == null
          ? null
          : _i2.Dashboard.fromJson(
              (jsonSerialization['dashboard'] as Map<String, dynamic>)),
      enable: jsonSerialization['enable'] as bool,
    );
  }

  static final t = DashboardWidgetTable();

  static const db = DashboardWidgetRepository._();

  String name;

  String description;

  int width;

  int height;

  int order;

  int deviceId;

  _i2.Device? device;

  List<String> fields;

  List<String> units;

  _i2.WidgetType type;

  List<String> labels;

  int points;

  int dashboardId;

  _i2.Dashboard? dashboard;

  bool enable;

  @override
  _i1.Table get table => t;

  DashboardWidget copyWith({
    int? id,
    String? name,
    String? description,
    int? width,
    int? height,
    int? order,
    int? deviceId,
    _i2.Device? device,
    List<String>? fields,
    List<String>? units,
    _i2.WidgetType? type,
    List<String>? labels,
    int? points,
    int? dashboardId,
    _i2.Dashboard? dashboard,
    bool? enable,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'description': description,
      'width': width,
      'height': height,
      'order': order,
      'deviceId': deviceId,
      if (device != null) 'device': device?.toJson(),
      'fields': fields.toJson(),
      'units': units.toJson(),
      'type': type.toJson(),
      'labels': labels.toJson(),
      'points': points,
      'dashboardId': dashboardId,
      if (dashboard != null) 'dashboard': dashboard?.toJson(),
      'enable': enable,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'description': description,
      'width': width,
      'height': height,
      'order': order,
      'deviceId': deviceId,
      if (device != null) 'device': device?.toJsonForProtocol(),
      'fields': fields.toJson(),
      'units': units.toJson(),
      'type': type.toJson(),
      'labels': labels.toJson(),
      'points': points,
      'dashboardId': dashboardId,
      if (dashboard != null) 'dashboard': dashboard?.toJsonForProtocol(),
      'enable': enable,
    };
  }

  static DashboardWidgetInclude include({
    _i2.DeviceInclude? device,
    _i2.DashboardInclude? dashboard,
  }) {
    return DashboardWidgetInclude._(
      device: device,
      dashboard: dashboard,
    );
  }

  static DashboardWidgetIncludeList includeList({
    _i1.WhereExpressionBuilder<DashboardWidgetTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DashboardWidgetTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DashboardWidgetTable>? orderByList,
    DashboardWidgetInclude? include,
  }) {
    return DashboardWidgetIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DashboardWidget.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(DashboardWidget.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DashboardWidgetImpl extends DashboardWidget {
  _DashboardWidgetImpl({
    int? id,
    required String name,
    required String description,
    int? width,
    int? height,
    int? order,
    required int deviceId,
    _i2.Device? device,
    required List<String> fields,
    required List<String> units,
    _i2.WidgetType? type,
    required List<String> labels,
    int? points,
    required int dashboardId,
    _i2.Dashboard? dashboard,
    bool? enable,
  }) : super._(
          id: id,
          name: name,
          description: description,
          width: width,
          height: height,
          order: order,
          deviceId: deviceId,
          device: device,
          fields: fields,
          units: units,
          type: type,
          labels: labels,
          points: points,
          dashboardId: dashboardId,
          dashboard: dashboard,
          enable: enable,
        );

  @override
  DashboardWidget copyWith({
    Object? id = _Undefined,
    String? name,
    String? description,
    int? width,
    int? height,
    int? order,
    int? deviceId,
    Object? device = _Undefined,
    List<String>? fields,
    List<String>? units,
    _i2.WidgetType? type,
    List<String>? labels,
    int? points,
    int? dashboardId,
    Object? dashboard = _Undefined,
    bool? enable,
  }) {
    return DashboardWidget(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      width: width ?? this.width,
      height: height ?? this.height,
      order: order ?? this.order,
      deviceId: deviceId ?? this.deviceId,
      device: device is _i2.Device? ? device : this.device?.copyWith(),
      fields: fields ?? this.fields.map((e0) => e0).toList(),
      units: units ?? this.units.map((e0) => e0).toList(),
      type: type ?? this.type,
      labels: labels ?? this.labels.map((e0) => e0).toList(),
      points: points ?? this.points,
      dashboardId: dashboardId ?? this.dashboardId,
      dashboard:
          dashboard is _i2.Dashboard? ? dashboard : this.dashboard?.copyWith(),
      enable: enable ?? this.enable,
    );
  }
}

class DashboardWidgetTable extends _i1.Table {
  DashboardWidgetTable({super.tableRelation})
      : super(tableName: 'dashboard_widget') {
    name = _i1.ColumnString(
      'name',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    width = _i1.ColumnInt(
      'width',
      this,
      hasDefault: true,
    );
    height = _i1.ColumnInt(
      'height',
      this,
      hasDefault: true,
    );
    order = _i1.ColumnInt(
      'order',
      this,
      hasDefault: true,
    );
    deviceId = _i1.ColumnInt(
      'deviceId',
      this,
    );
    fields = _i1.ColumnSerializable(
      'fields',
      this,
    );
    units = _i1.ColumnSerializable(
      'units',
      this,
    );
    type = _i1.ColumnEnum(
      'type',
      this,
      _i1.EnumSerialization.byName,
      hasDefault: true,
    );
    labels = _i1.ColumnSerializable(
      'labels',
      this,
    );
    points = _i1.ColumnInt(
      'points',
      this,
      hasDefault: true,
    );
    dashboardId = _i1.ColumnInt(
      'dashboardId',
      this,
    );
    enable = _i1.ColumnBool(
      'enable',
      this,
      hasDefault: true,
    );
  }

  late final _i1.ColumnString name;

  late final _i1.ColumnString description;

  late final _i1.ColumnInt width;

  late final _i1.ColumnInt height;

  late final _i1.ColumnInt order;

  late final _i1.ColumnInt deviceId;

  _i2.DeviceTable? _device;

  late final _i1.ColumnSerializable fields;

  late final _i1.ColumnSerializable units;

  late final _i1.ColumnEnum<_i2.WidgetType> type;

  late final _i1.ColumnSerializable labels;

  late final _i1.ColumnInt points;

  late final _i1.ColumnInt dashboardId;

  _i2.DashboardTable? _dashboard;

  late final _i1.ColumnBool enable;

  _i2.DeviceTable get device {
    if (_device != null) return _device!;
    _device = _i1.createRelationTable(
      relationFieldName: 'device',
      field: DashboardWidget.t.deviceId,
      foreignField: _i2.Device.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.DeviceTable(tableRelation: foreignTableRelation),
    );
    return _device!;
  }

  _i2.DashboardTable get dashboard {
    if (_dashboard != null) return _dashboard!;
    _dashboard = _i1.createRelationTable(
      relationFieldName: 'dashboard',
      field: DashboardWidget.t.dashboardId,
      foreignField: _i2.Dashboard.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.DashboardTable(tableRelation: foreignTableRelation),
    );
    return _dashboard!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        description,
        width,
        height,
        order,
        deviceId,
        fields,
        units,
        type,
        labels,
        points,
        dashboardId,
        enable,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'device') {
      return device;
    }
    if (relationField == 'dashboard') {
      return dashboard;
    }
    return null;
  }
}

class DashboardWidgetInclude extends _i1.IncludeObject {
  DashboardWidgetInclude._({
    _i2.DeviceInclude? device,
    _i2.DashboardInclude? dashboard,
  }) {
    _device = device;
    _dashboard = dashboard;
  }

  _i2.DeviceInclude? _device;

  _i2.DashboardInclude? _dashboard;

  @override
  Map<String, _i1.Include?> get includes => {
        'device': _device,
        'dashboard': _dashboard,
      };

  @override
  _i1.Table get table => DashboardWidget.t;
}

class DashboardWidgetIncludeList extends _i1.IncludeList {
  DashboardWidgetIncludeList._({
    _i1.WhereExpressionBuilder<DashboardWidgetTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(DashboardWidget.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => DashboardWidget.t;
}

class DashboardWidgetRepository {
  const DashboardWidgetRepository._();

  final attachRow = const DashboardWidgetAttachRowRepository._();

  Future<List<DashboardWidget>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DashboardWidgetTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DashboardWidgetTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DashboardWidgetTable>? orderByList,
    _i1.Transaction? transaction,
    DashboardWidgetInclude? include,
  }) async {
    return session.db.find<DashboardWidget>(
      where: where?.call(DashboardWidget.t),
      orderBy: orderBy?.call(DashboardWidget.t),
      orderByList: orderByList?.call(DashboardWidget.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<DashboardWidget?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DashboardWidgetTable>? where,
    int? offset,
    _i1.OrderByBuilder<DashboardWidgetTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DashboardWidgetTable>? orderByList,
    _i1.Transaction? transaction,
    DashboardWidgetInclude? include,
  }) async {
    return session.db.findFirstRow<DashboardWidget>(
      where: where?.call(DashboardWidget.t),
      orderBy: orderBy?.call(DashboardWidget.t),
      orderByList: orderByList?.call(DashboardWidget.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<DashboardWidget?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    DashboardWidgetInclude? include,
  }) async {
    return session.db.findById<DashboardWidget>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<DashboardWidget>> insert(
    _i1.Session session,
    List<DashboardWidget> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<DashboardWidget>(
      rows,
      transaction: transaction,
    );
  }

  Future<DashboardWidget> insertRow(
    _i1.Session session,
    DashboardWidget row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<DashboardWidget>(
      row,
      transaction: transaction,
    );
  }

  Future<List<DashboardWidget>> update(
    _i1.Session session,
    List<DashboardWidget> rows, {
    _i1.ColumnSelections<DashboardWidgetTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<DashboardWidget>(
      rows,
      columns: columns?.call(DashboardWidget.t),
      transaction: transaction,
    );
  }

  Future<DashboardWidget> updateRow(
    _i1.Session session,
    DashboardWidget row, {
    _i1.ColumnSelections<DashboardWidgetTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<DashboardWidget>(
      row,
      columns: columns?.call(DashboardWidget.t),
      transaction: transaction,
    );
  }

  Future<List<DashboardWidget>> delete(
    _i1.Session session,
    List<DashboardWidget> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<DashboardWidget>(
      rows,
      transaction: transaction,
    );
  }

  Future<DashboardWidget> deleteRow(
    _i1.Session session,
    DashboardWidget row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<DashboardWidget>(
      row,
      transaction: transaction,
    );
  }

  Future<List<DashboardWidget>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<DashboardWidgetTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<DashboardWidget>(
      where: where(DashboardWidget.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DashboardWidgetTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<DashboardWidget>(
      where: where?.call(DashboardWidget.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class DashboardWidgetAttachRowRepository {
  const DashboardWidgetAttachRowRepository._();

  Future<void> device(
    _i1.Session session,
    DashboardWidget dashboardWidget,
    _i2.Device device, {
    _i1.Transaction? transaction,
  }) async {
    if (dashboardWidget.id == null) {
      throw ArgumentError.notNull('dashboardWidget.id');
    }
    if (device.id == null) {
      throw ArgumentError.notNull('device.id');
    }

    var $dashboardWidget = dashboardWidget.copyWith(deviceId: device.id);
    await session.db.updateRow<DashboardWidget>(
      $dashboardWidget,
      columns: [DashboardWidget.t.deviceId],
      transaction: transaction,
    );
  }

  Future<void> dashboard(
    _i1.Session session,
    DashboardWidget dashboardWidget,
    _i2.Dashboard dashboard, {
    _i1.Transaction? transaction,
  }) async {
    if (dashboardWidget.id == null) {
      throw ArgumentError.notNull('dashboardWidget.id');
    }
    if (dashboard.id == null) {
      throw ArgumentError.notNull('dashboard.id');
    }

    var $dashboardWidget = dashboardWidget.copyWith(dashboardId: dashboard.id);
    await session.db.updateRow<DashboardWidget>(
      $dashboardWidget,
      columns: [DashboardWidget.t.dashboardId],
      transaction: transaction,
    );
  }
}
