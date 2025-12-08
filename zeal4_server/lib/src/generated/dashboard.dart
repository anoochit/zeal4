/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: unnecessary_null_comparison

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'widget.dart' as _i2;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i3;
import 'package:zeal4_server/src/generated/protocol.dart' as _i4;

abstract class Dashboard
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = DashboardTable();

  static const db = DashboardRepository._();

  @override
  int? id;

  String name;

  String description;

  List<_i2.DashboardWidget>? widget;

  int userInfoId;

  _i3.UserInfo? userInfo;

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Dashboard',
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

class DashboardUpdateTable extends _i1.UpdateTable<DashboardTable> {
  DashboardUpdateTable(super.table);

  _i1.ColumnValue<String, String> name(String value) => _i1.ColumnValue(
    table.name,
    value,
  );

  _i1.ColumnValue<String, String> description(String value) => _i1.ColumnValue(
    table.description,
    value,
  );

  _i1.ColumnValue<int, int> userInfoId(int value) => _i1.ColumnValue(
    table.userInfoId,
    value,
  );
}

class DashboardTable extends _i1.Table<int?> {
  DashboardTable({super.tableRelation}) : super(tableName: 'dashboard') {
    updateTable = DashboardUpdateTable(this);
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

  late final DashboardUpdateTable updateTable;

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
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
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
  _i1.Table<int?> get table => Dashboard.t;
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
  _i1.Table<int?> get table => Dashboard.t;
}

class DashboardRepository {
  const DashboardRepository._();

  final attach = const DashboardAttachRepository._();

  final attachRow = const DashboardAttachRowRepository._();

  final detach = const DashboardDetachRepository._();

  final detachRow = const DashboardDetachRowRepository._();

  /// Returns a list of [Dashboard]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<Dashboard>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DashboardTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DashboardTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DashboardTable>? orderByList,
    _i1.Transaction? transaction,
    DashboardInclude? include,
  }) async {
    return session.db.find<Dashboard>(
      where: where?.call(Dashboard.t),
      orderBy: orderBy?.call(Dashboard.t),
      orderByList: orderByList?.call(Dashboard.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Dashboard] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<Dashboard?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DashboardTable>? where,
    int? offset,
    _i1.OrderByBuilder<DashboardTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DashboardTable>? orderByList,
    _i1.Transaction? transaction,
    DashboardInclude? include,
  }) async {
    return session.db.findFirstRow<Dashboard>(
      where: where?.call(Dashboard.t),
      orderBy: orderBy?.call(Dashboard.t),
      orderByList: orderByList?.call(Dashboard.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Dashboard] by its [id] or null if no such row exists.
  Future<Dashboard?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    DashboardInclude? include,
  }) async {
    return session.db.findById<Dashboard>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Dashboard]s in the list and returns the inserted rows.
  ///
  /// The returned [Dashboard]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Dashboard>> insert(
    _i1.Session session,
    List<Dashboard> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Dashboard>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Dashboard] and returns the inserted row.
  ///
  /// The returned [Dashboard] will have its `id` field set.
  Future<Dashboard> insertRow(
    _i1.Session session,
    Dashboard row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Dashboard>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Dashboard]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Dashboard>> update(
    _i1.Session session,
    List<Dashboard> rows, {
    _i1.ColumnSelections<DashboardTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Dashboard>(
      rows,
      columns: columns?.call(Dashboard.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Dashboard]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Dashboard> updateRow(
    _i1.Session session,
    Dashboard row, {
    _i1.ColumnSelections<DashboardTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Dashboard>(
      row,
      columns: columns?.call(Dashboard.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Dashboard] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Dashboard?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<DashboardUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Dashboard>(
      id,
      columnValues: columnValues(Dashboard.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Dashboard]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Dashboard>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<DashboardUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<DashboardTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DashboardTable>? orderBy,
    _i1.OrderByListBuilder<DashboardTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Dashboard>(
      columnValues: columnValues(Dashboard.t.updateTable),
      where: where(Dashboard.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Dashboard.t),
      orderByList: orderByList?.call(Dashboard.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Dashboard]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Dashboard>> delete(
    _i1.Session session,
    List<Dashboard> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Dashboard>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Dashboard].
  Future<Dashboard> deleteRow(
    _i1.Session session,
    Dashboard row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Dashboard>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Dashboard>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<DashboardTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Dashboard>(
      where: where(Dashboard.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DashboardTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Dashboard>(
      where: where?.call(Dashboard.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class DashboardAttachRepository {
  const DashboardAttachRepository._();

  /// Creates a relation between this [Dashboard] and the given [DashboardWidget]s
  /// by setting each [DashboardWidget]'s foreign key `dashboardId` to refer to this [Dashboard].
  Future<void> widget(
    _i1.Session session,
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
    await session.db.update<_i2.DashboardWidget>(
      $dashboardWidget,
      columns: [_i2.DashboardWidget.t.dashboardId],
      transaction: transaction,
    );
  }
}

class DashboardAttachRowRepository {
  const DashboardAttachRowRepository._();

  /// Creates a relation between the given [Dashboard] and [UserInfo]
  /// by setting the [Dashboard]'s foreign key `userInfoId` to refer to the [UserInfo].
  Future<void> userInfo(
    _i1.Session session,
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
    await session.db.updateRow<Dashboard>(
      $dashboard,
      columns: [Dashboard.t.userInfoId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Dashboard] and the given [DashboardWidget]
  /// by setting the [DashboardWidget]'s foreign key `dashboardId` to refer to this [Dashboard].
  Future<void> widget(
    _i1.Session session,
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
    await session.db.updateRow<_i2.DashboardWidget>(
      $dashboardWidget,
      columns: [_i2.DashboardWidget.t.dashboardId],
      transaction: transaction,
    );
  }
}

class DashboardDetachRepository {
  const DashboardDetachRepository._();

  /// Detaches the relation between this [Dashboard] and the given [DashboardWidget]
  /// by setting the [DashboardWidget]'s foreign key `dashboardId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> widget(
    _i1.Session session,
    List<_i2.DashboardWidget> dashboardWidget, {
    _i1.Transaction? transaction,
  }) async {
    if (dashboardWidget.any((e) => e.id == null)) {
      throw ArgumentError.notNull('dashboardWidget.id');
    }

    var $dashboardWidget = dashboardWidget
        .map((e) => e.copyWith(dashboardId: null))
        .toList();
    await session.db.update<_i2.DashboardWidget>(
      $dashboardWidget,
      columns: [_i2.DashboardWidget.t.dashboardId],
      transaction: transaction,
    );
  }
}

class DashboardDetachRowRepository {
  const DashboardDetachRowRepository._();

  /// Detaches the relation between this [Dashboard] and the given [DashboardWidget]
  /// by setting the [DashboardWidget]'s foreign key `dashboardId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> widget(
    _i1.Session session,
    _i2.DashboardWidget dashboardWidget, {
    _i1.Transaction? transaction,
  }) async {
    if (dashboardWidget.id == null) {
      throw ArgumentError.notNull('dashboardWidget.id');
    }

    var $dashboardWidget = dashboardWidget.copyWith(dashboardId: null);
    await session.db.updateRow<_i2.DashboardWidget>(
      $dashboardWidget,
      columns: [_i2.DashboardWidget.t.dashboardId],
      transaction: transaction,
    );
  }
}
