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
    required this.datasource,
    required this.fields,
    _i2.WidgetType? type,
    int? points,
    required this.dashboardId,
    this.dashboard,
  })  : type = type ?? _i2.WidgetType.text,
        points = points ?? 360,
        super(id);

  factory DashboardWidget({
    int? id,
    required String name,
    required String description,
    required _i2.Device datasource,
    required String fields,
    _i2.WidgetType? type,
    int? points,
    required int dashboardId,
    _i2.Dashboard? dashboard,
  }) = _DashboardWidgetImpl;

  factory DashboardWidget.fromJson(Map<String, dynamic> jsonSerialization) {
    return DashboardWidget(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String,
      datasource: _i2.Device.fromJson(
          (jsonSerialization['datasource'] as Map<String, dynamic>)),
      fields: jsonSerialization['fields'] as String,
      type: _i2.WidgetType.fromJson((jsonSerialization['type'] as String)),
      points: jsonSerialization['points'] as int,
      dashboardId: jsonSerialization['dashboardId'] as int,
      dashboard: jsonSerialization['dashboard'] == null
          ? null
          : _i2.Dashboard.fromJson(
              (jsonSerialization['dashboard'] as Map<String, dynamic>)),
    );
  }

  static final t = DashboardWidgetTable();

  static const db = DashboardWidgetRepository._();

  String name;

  String description;

  _i2.Device datasource;

  String fields;

  _i2.WidgetType type;

  int points;

  int dashboardId;

  _i2.Dashboard? dashboard;

  @override
  _i1.Table get table => t;

  DashboardWidget copyWith({
    int? id,
    String? name,
    String? description,
    _i2.Device? datasource,
    String? fields,
    _i2.WidgetType? type,
    int? points,
    int? dashboardId,
    _i2.Dashboard? dashboard,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'description': description,
      'datasource': datasource.toJson(),
      'fields': fields,
      'type': type.toJson(),
      'points': points,
      'dashboardId': dashboardId,
      if (dashboard != null) 'dashboard': dashboard?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'description': description,
      'datasource': datasource.toJsonForProtocol(),
      'fields': fields,
      'type': type.toJson(),
      'points': points,
      'dashboardId': dashboardId,
      if (dashboard != null) 'dashboard': dashboard?.toJsonForProtocol(),
    };
  }

  static DashboardWidgetInclude include({_i2.DashboardInclude? dashboard}) {
    return DashboardWidgetInclude._(dashboard: dashboard);
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
    required _i2.Device datasource,
    required String fields,
    _i2.WidgetType? type,
    int? points,
    required int dashboardId,
    _i2.Dashboard? dashboard,
  }) : super._(
          id: id,
          name: name,
          description: description,
          datasource: datasource,
          fields: fields,
          type: type,
          points: points,
          dashboardId: dashboardId,
          dashboard: dashboard,
        );

  @override
  DashboardWidget copyWith({
    Object? id = _Undefined,
    String? name,
    String? description,
    _i2.Device? datasource,
    String? fields,
    _i2.WidgetType? type,
    int? points,
    int? dashboardId,
    Object? dashboard = _Undefined,
  }) {
    return DashboardWidget(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      datasource: datasource ?? this.datasource.copyWith(),
      fields: fields ?? this.fields,
      type: type ?? this.type,
      points: points ?? this.points,
      dashboardId: dashboardId ?? this.dashboardId,
      dashboard:
          dashboard is _i2.Dashboard? ? dashboard : this.dashboard?.copyWith(),
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
    datasource = _i1.ColumnSerializable(
      'datasource',
      this,
    );
    fields = _i1.ColumnString(
      'fields',
      this,
    );
    type = _i1.ColumnEnum(
      'type',
      this,
      _i1.EnumSerialization.byName,
      hasDefault: true,
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
  }

  late final _i1.ColumnString name;

  late final _i1.ColumnString description;

  late final _i1.ColumnSerializable datasource;

  late final _i1.ColumnString fields;

  late final _i1.ColumnEnum<_i2.WidgetType> type;

  late final _i1.ColumnInt points;

  late final _i1.ColumnInt dashboardId;

  _i2.DashboardTable? _dashboard;

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
        datasource,
        fields,
        type,
        points,
        dashboardId,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'dashboard') {
      return dashboard;
    }
    return null;
  }
}

class DashboardWidgetInclude extends _i1.IncludeObject {
  DashboardWidgetInclude._({_i2.DashboardInclude? dashboard}) {
    _dashboard = dashboard;
  }

  _i2.DashboardInclude? _dashboard;

  @override
  Map<String, _i1.Include?> get includes => {'dashboard': _dashboard};

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
