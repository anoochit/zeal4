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
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i3;

abstract class Dashboard extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  Dashboard._({
    int? id,
    required this.name,
    required this.description,
    this.widget,
    required this.userInfoId,
    this.userInfo,
  }) : super(id);

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
      widget: (jsonSerialization['widget'] as List?)
          ?.map(
              (e) => _i2.DashboardWidget.fromJson((e as Map<String, dynamic>)))
          .toList(),
      userInfoId: jsonSerialization['userInfoId'] as int,
      userInfo: jsonSerialization['userInfo'] == null
          ? null
          : _i3.UserInfo.fromJson(
              (jsonSerialization['userInfo'] as Map<String, dynamic>)),
    );
  }

  static final t = DashboardTable();

  static const db = DashboardRepository._();

  String name;

  String description;

  List<_i2.DashboardWidget>? widget;

  int userInfoId;

  _i3.UserInfo? userInfo;

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'description': description,
      if (widget != null)
        'widget': widget?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJsonForProtocol(),
    };
  }

  static DashboardInclude include({
    _i2.DashboardWidgetIncludeList? widget,
    _i3.UserInfoInclude? userInfo,
  }) {
    return DashboardInclude._(
      widget: widget,
      userInfo: userInfo,
    );
  }

  static DashboardIncludeList includeList({
    _i1.WhereExpressionBuilder<DashboardTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DashboardTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DashboardTable>? orderByList,
    DashboardInclude? include,
  }) {
    return DashboardIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Dashboard.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Dashboard.t),
      include: include,
    );
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
      userInfo:
          userInfo is _i3.UserInfo? ? userInfo : this.userInfo?.copyWith(),
    );
  }
}

class DashboardTable extends _i1.Table {
  DashboardTable({super.tableRelation}) : super(tableName: 'dashboard') {
    name = _i1.ColumnString(
      'name',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    userInfoId = _i1.ColumnInt(
      'userInfoId',
      this,
    );
  }

  late final _i1.ColumnString name;

  late final _i1.ColumnString description;

  _i2.DashboardWidgetTable? ___widget;

  _i1.ManyRelation<_i2.DashboardWidgetTable>? _widget;

  late final _i1.ColumnInt userInfoId;

  _i3.UserInfoTable? _userInfo;

  _i2.DashboardWidgetTable get __widget {
    if (___widget != null) return ___widget!;
    ___widget = _i1.createRelationTable(
      relationFieldName: '__widget',
      field: Dashboard.t.id,
      foreignField: _i2.DashboardWidget.t.dashboardId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.DashboardWidgetTable(tableRelation: foreignTableRelation),
    );
    return ___widget!;
  }

  _i3.UserInfoTable get userInfo {
    if (_userInfo != null) return _userInfo!;
    _userInfo = _i1.createRelationTable(
      relationFieldName: 'userInfo',
      field: Dashboard.t.userInfoId,
      foreignField: _i3.UserInfo.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.UserInfoTable(tableRelation: foreignTableRelation),
    );
    return _userInfo!;
  }

  _i1.ManyRelation<_i2.DashboardWidgetTable> get widget {
    if (_widget != null) return _widget!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'widget',
      field: Dashboard.t.id,
      foreignField: _i2.DashboardWidget.t.dashboardId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.DashboardWidgetTable(tableRelation: foreignTableRelation),
    );
    _widget = _i1.ManyRelation<_i2.DashboardWidgetTable>(
      tableWithRelations: relationTable,
      table: _i2.DashboardWidgetTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _widget!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        description,
        userInfoId,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'widget') {
      return __widget;
    }
    if (relationField == 'userInfo') {
      return userInfo;
    }
    return null;
  }
}

class DashboardInclude extends _i1.IncludeObject {
  DashboardInclude._({
    _i2.DashboardWidgetIncludeList? widget,
    _i3.UserInfoInclude? userInfo,
  }) {
    _widget = widget;
    _userInfo = userInfo;
  }

  _i2.DashboardWidgetIncludeList? _widget;

  _i3.UserInfoInclude? _userInfo;

  @override
  Map<String, _i1.Include?> get includes => {
        'widget': _widget,
        'userInfo': _userInfo,
      };

  @override
  _i1.Table get table => Dashboard.t;
}

class DashboardIncludeList extends _i1.IncludeList {
  DashboardIncludeList._({
    _i1.WhereExpressionBuilder<DashboardTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Dashboard.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Dashboard.t;
}

class DashboardRepository {
  const DashboardRepository._();

  final attach = const DashboardAttachRepository._();

  final attachRow = const DashboardAttachRowRepository._();

  final detach = const DashboardDetachRepository._();

  final detachRow = const DashboardDetachRowRepository._();

  Future<List<Dashboard>> find(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<DashboardTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DashboardTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DashboardTable>? orderByList,
    _i1.Transaction? transaction,
    DashboardInclude? include,
  }) async {
    return databaseAccessor.db.find<Dashboard>(
      where: where?.call(Dashboard.t),
      orderBy: orderBy?.call(Dashboard.t),
      orderByList: orderByList?.call(Dashboard.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction ?? databaseAccessor.transaction,
      include: include,
    );
  }

  Future<Dashboard?> findFirstRow(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<DashboardTable>? where,
    int? offset,
    _i1.OrderByBuilder<DashboardTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DashboardTable>? orderByList,
    _i1.Transaction? transaction,
    DashboardInclude? include,
  }) async {
    return databaseAccessor.db.findFirstRow<Dashboard>(
      where: where?.call(Dashboard.t),
      orderBy: orderBy?.call(Dashboard.t),
      orderByList: orderByList?.call(Dashboard.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction ?? databaseAccessor.transaction,
      include: include,
    );
  }

  Future<Dashboard?> findById(
    _i1.DatabaseAccessor databaseAccessor,
    int id, {
    _i1.Transaction? transaction,
    DashboardInclude? include,
  }) async {
    return databaseAccessor.db.findById<Dashboard>(
      id,
      transaction: transaction ?? databaseAccessor.transaction,
      include: include,
    );
  }

  Future<List<Dashboard>> insert(
    _i1.DatabaseAccessor databaseAccessor,
    List<Dashboard> rows, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.insert<Dashboard>(
      rows,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<Dashboard> insertRow(
    _i1.DatabaseAccessor databaseAccessor,
    Dashboard row, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.insertRow<Dashboard>(
      row,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<Dashboard>> update(
    _i1.DatabaseAccessor databaseAccessor,
    List<Dashboard> rows, {
    _i1.ColumnSelections<DashboardTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.update<Dashboard>(
      rows,
      columns: columns?.call(Dashboard.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<Dashboard> updateRow(
    _i1.DatabaseAccessor databaseAccessor,
    Dashboard row, {
    _i1.ColumnSelections<DashboardTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.updateRow<Dashboard>(
      row,
      columns: columns?.call(Dashboard.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<Dashboard>> delete(
    _i1.DatabaseAccessor databaseAccessor,
    List<Dashboard> rows, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.delete<Dashboard>(
      rows,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<Dashboard> deleteRow(
    _i1.DatabaseAccessor databaseAccessor,
    Dashboard row, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.deleteRow<Dashboard>(
      row,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<Dashboard>> deleteWhere(
    _i1.DatabaseAccessor databaseAccessor, {
    required _i1.WhereExpressionBuilder<DashboardTable> where,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.deleteWhere<Dashboard>(
      where: where(Dashboard.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<int> count(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<DashboardTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.count<Dashboard>(
      where: where?.call(Dashboard.t),
      limit: limit,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }
}

class DashboardAttachRepository {
  const DashboardAttachRepository._();

  Future<void> widget(
    _i1.DatabaseAccessor databaseAccessor,
    Dashboard dashboard,
    List<_i2.DashboardWidget> dashboardWidget, {
    _i1.Transaction? transaction,
  }) async {
    if (dashboardWidget.any((e) => e.id == null)) {
      throw ArgumentError.notNull('dashboardWidget.id');
    }
    if (dashboard.id == null) {
      throw ArgumentError.notNull('dashboard.id');
    }

    var $dashboardWidget = dashboardWidget
        .map((e) => e.copyWith(dashboardId: dashboard.id))
        .toList();
    await databaseAccessor.db.update<_i2.DashboardWidget>(
      $dashboardWidget,
      columns: [_i2.DashboardWidget.t.dashboardId],
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }
}

class DashboardAttachRowRepository {
  const DashboardAttachRowRepository._();

  Future<void> userInfo(
    _i1.DatabaseAccessor databaseAccessor,
    Dashboard dashboard,
    _i3.UserInfo userInfo, {
    _i1.Transaction? transaction,
  }) async {
    if (dashboard.id == null) {
      throw ArgumentError.notNull('dashboard.id');
    }
    if (userInfo.id == null) {
      throw ArgumentError.notNull('userInfo.id');
    }

    var $dashboard = dashboard.copyWith(userInfoId: userInfo.id);
    await databaseAccessor.db.updateRow<Dashboard>(
      $dashboard,
      columns: [Dashboard.t.userInfoId],
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<void> widget(
    _i1.DatabaseAccessor databaseAccessor,
    Dashboard dashboard,
    _i2.DashboardWidget dashboardWidget, {
    _i1.Transaction? transaction,
  }) async {
    if (dashboardWidget.id == null) {
      throw ArgumentError.notNull('dashboardWidget.id');
    }
    if (dashboard.id == null) {
      throw ArgumentError.notNull('dashboard.id');
    }

    var $dashboardWidget = dashboardWidget.copyWith(dashboardId: dashboard.id);
    await databaseAccessor.db.updateRow<_i2.DashboardWidget>(
      $dashboardWidget,
      columns: [_i2.DashboardWidget.t.dashboardId],
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }
}

class DashboardDetachRepository {
  const DashboardDetachRepository._();

  Future<void> widget(
    _i1.DatabaseAccessor databaseAccessor,
    List<_i2.DashboardWidget> dashboardWidget, {
    _i1.Transaction? transaction,
  }) async {
    if (dashboardWidget.any((e) => e.id == null)) {
      throw ArgumentError.notNull('dashboardWidget.id');
    }

    var $dashboardWidget =
        dashboardWidget.map((e) => e.copyWith(dashboardId: null)).toList();
    await databaseAccessor.db.update<_i2.DashboardWidget>(
      $dashboardWidget,
      columns: [_i2.DashboardWidget.t.dashboardId],
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }
}

class DashboardDetachRowRepository {
  const DashboardDetachRowRepository._();

  Future<void> widget(
    _i1.DatabaseAccessor databaseAccessor,
    _i2.DashboardWidget dashboardWidget, {
    _i1.Transaction? transaction,
  }) async {
    if (dashboardWidget.id == null) {
      throw ArgumentError.notNull('dashboardWidget.id');
    }

    var $dashboardWidget = dashboardWidget.copyWith(dashboardId: null);
    await databaseAccessor.db.updateRow<_i2.DashboardWidget>(
      $dashboardWidget,
      columns: [_i2.DashboardWidget.t.dashboardId],
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }
}
