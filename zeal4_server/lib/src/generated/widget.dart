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
import 'widget_type.dart' as _i2;
import 'device.dart' as _i3;
import 'dashboard.dart' as _i4;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i5;
import 'package:zeal4_server/src/generated/protocol.dart' as _i6;

abstract class DashboardWidget
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  DashboardWidget._({
    this.id,
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
    required this.userInfoId,
    this.userInfo,
    bool? enable,
  }) : width = width ?? 3,
       height = height ?? 1,
       order = order ?? 1,
       type = type ?? _i2.WidgetType.text,
       points = points ?? 60,
       enable = enable ?? false;

  factory DashboardWidget({
    int? id,
    required String name,
    required String description,
    int? width,
    int? height,
    int? order,
    required int deviceId,
    _i3.Device? device,
    required List<String> fields,
    required List<String> units,
    _i2.WidgetType? type,
    required List<String> labels,
    int? points,
    required int dashboardId,
    _i4.Dashboard? dashboard,
    required int userInfoId,
    _i5.UserInfo? userInfo,
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
          : _i6.Protocol().deserialize<_i3.Device>(jsonSerialization['device']),
      fields: _i6.Protocol().deserialize<List<String>>(
        jsonSerialization['fields'],
      ),
      units: _i6.Protocol().deserialize<List<String>>(
        jsonSerialization['units'],
      ),
      type: _i2.WidgetType.fromJson((jsonSerialization['type'] as String)),
      labels: _i6.Protocol().deserialize<List<String>>(
        jsonSerialization['labels'],
      ),
      points: jsonSerialization['points'] as int,
      dashboardId: jsonSerialization['dashboardId'] as int,
      dashboard: jsonSerialization['dashboard'] == null
          ? null
          : _i6.Protocol().deserialize<_i4.Dashboard>(
              jsonSerialization['dashboard'],
            ),
      userInfoId: jsonSerialization['userInfoId'] as int,
      userInfo: jsonSerialization['userInfo'] == null
          ? null
          : _i6.Protocol().deserialize<_i5.UserInfo>(
              jsonSerialization['userInfo'],
            ),
      enable: jsonSerialization['enable'] as bool,
    );
  }

  static final t = DashboardWidgetTable();

  static const db = DashboardWidgetRepository._();

  @override
  int? id;

  String name;

  String description;

  int width;

  int height;

  int order;

  int deviceId;

  _i3.Device? device;

  List<String> fields;

  List<String> units;

  _i2.WidgetType type;

  List<String> labels;

  int points;

  int dashboardId;

  _i4.Dashboard? dashboard;

  int userInfoId;

  _i5.UserInfo? userInfo;

  bool enable;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [DashboardWidget]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DashboardWidget copyWith({
    int? id,
    String? name,
    String? description,
    int? width,
    int? height,
    int? order,
    int? deviceId,
    _i3.Device? device,
    List<String>? fields,
    List<String>? units,
    _i2.WidgetType? type,
    List<String>? labels,
    int? points,
    int? dashboardId,
    _i4.Dashboard? dashboard,
    int? userInfoId,
    _i5.UserInfo? userInfo,
    bool? enable,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'DashboardWidget',
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
      'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJson(),
      'enable': enable,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'DashboardWidget',
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
      'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJsonForProtocol(),
      'enable': enable,
    };
  }

  static DashboardWidgetInclude include({
    _i3.DeviceInclude? device,
    _i4.DashboardInclude? dashboard,
    _i5.UserInfoInclude? userInfo,
  }) {
    return DashboardWidgetInclude._(
      device: device,
      dashboard: dashboard,
      userInfo: userInfo,
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
    _i3.Device? device,
    required List<String> fields,
    required List<String> units,
    _i2.WidgetType? type,
    required List<String> labels,
    int? points,
    required int dashboardId,
    _i4.Dashboard? dashboard,
    required int userInfoId,
    _i5.UserInfo? userInfo,
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
         userInfoId: userInfoId,
         userInfo: userInfo,
         enable: enable,
       );

  /// Returns a shallow copy of this [DashboardWidget]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
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
    int? userInfoId,
    Object? userInfo = _Undefined,
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
      device: device is _i3.Device? ? device : this.device?.copyWith(),
      fields: fields ?? this.fields.map((e0) => e0).toList(),
      units: units ?? this.units.map((e0) => e0).toList(),
      type: type ?? this.type,
      labels: labels ?? this.labels.map((e0) => e0).toList(),
      points: points ?? this.points,
      dashboardId: dashboardId ?? this.dashboardId,
      dashboard: dashboard is _i4.Dashboard?
          ? dashboard
          : this.dashboard?.copyWith(),
      userInfoId: userInfoId ?? this.userInfoId,
      userInfo: userInfo is _i5.UserInfo?
          ? userInfo
          : this.userInfo?.copyWith(),
      enable: enable ?? this.enable,
    );
  }
}

class DashboardWidgetUpdateTable extends _i1.UpdateTable<DashboardWidgetTable> {
  DashboardWidgetUpdateTable(super.table);

  _i1.ColumnValue<String, String> name(String value) => _i1.ColumnValue(
    table.name,
    value,
  );

  _i1.ColumnValue<String, String> description(String value) => _i1.ColumnValue(
    table.description,
    value,
  );

  _i1.ColumnValue<int, int> width(int value) => _i1.ColumnValue(
    table.width,
    value,
  );

  _i1.ColumnValue<int, int> height(int value) => _i1.ColumnValue(
    table.height,
    value,
  );

  _i1.ColumnValue<int, int> order(int value) => _i1.ColumnValue(
    table.order,
    value,
  );

  _i1.ColumnValue<int, int> deviceId(int value) => _i1.ColumnValue(
    table.deviceId,
    value,
  );

  _i1.ColumnValue<List<String>, List<String>> fields(List<String> value) =>
      _i1.ColumnValue(
        table.fields,
        value,
      );

  _i1.ColumnValue<List<String>, List<String>> units(List<String> value) =>
      _i1.ColumnValue(
        table.units,
        value,
      );

  _i1.ColumnValue<_i2.WidgetType, _i2.WidgetType> type(_i2.WidgetType value) =>
      _i1.ColumnValue(
        table.type,
        value,
      );

  _i1.ColumnValue<List<String>, List<String>> labels(List<String> value) =>
      _i1.ColumnValue(
        table.labels,
        value,
      );

  _i1.ColumnValue<int, int> points(int value) => _i1.ColumnValue(
    table.points,
    value,
  );

  _i1.ColumnValue<int, int> dashboardId(int value) => _i1.ColumnValue(
    table.dashboardId,
    value,
  );

  _i1.ColumnValue<int, int> userInfoId(int value) => _i1.ColumnValue(
    table.userInfoId,
    value,
  );

  _i1.ColumnValue<bool, bool> enable(bool value) => _i1.ColumnValue(
    table.enable,
    value,
  );
}

class DashboardWidgetTable extends _i1.Table<int?> {
  DashboardWidgetTable({super.tableRelation})
    : super(tableName: 'dashboard_widget') {
    updateTable = DashboardWidgetUpdateTable(this);
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
    fields = _i1.ColumnSerializable<List<String>>(
      'fields',
      this,
    );
    units = _i1.ColumnSerializable<List<String>>(
      'units',
      this,
    );
    type = _i1.ColumnEnum(
      'type',
      this,
      _i1.EnumSerialization.byName,
      hasDefault: true,
    );
    labels = _i1.ColumnSerializable<List<String>>(
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
    userInfoId = _i1.ColumnInt(
      'userInfoId',
      this,
    );
    enable = _i1.ColumnBool(
      'enable',
      this,
      hasDefault: true,
    );
  }

  late final DashboardWidgetUpdateTable updateTable;

  late final _i1.ColumnString name;

  late final _i1.ColumnString description;

  late final _i1.ColumnInt width;

  late final _i1.ColumnInt height;

  late final _i1.ColumnInt order;

  late final _i1.ColumnInt deviceId;

  _i3.DeviceTable? _device;

  late final _i1.ColumnSerializable<List<String>> fields;

  late final _i1.ColumnSerializable<List<String>> units;

  late final _i1.ColumnEnum<_i2.WidgetType> type;

  late final _i1.ColumnSerializable<List<String>> labels;

  late final _i1.ColumnInt points;

  late final _i1.ColumnInt dashboardId;

  _i4.DashboardTable? _dashboard;

  late final _i1.ColumnInt userInfoId;

  _i5.UserInfoTable? _userInfo;

  late final _i1.ColumnBool enable;

  _i3.DeviceTable get device {
    if (_device != null) return _device!;
    _device = _i1.createRelationTable(
      relationFieldName: 'device',
      field: DashboardWidget.t.deviceId,
      foreignField: _i3.Device.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.DeviceTable(tableRelation: foreignTableRelation),
    );
    return _device!;
  }

  _i4.DashboardTable get dashboard {
    if (_dashboard != null) return _dashboard!;
    _dashboard = _i1.createRelationTable(
      relationFieldName: 'dashboard',
      field: DashboardWidget.t.dashboardId,
      foreignField: _i4.Dashboard.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.DashboardTable(tableRelation: foreignTableRelation),
    );
    return _dashboard!;
  }

  _i5.UserInfoTable get userInfo {
    if (_userInfo != null) return _userInfo!;
    _userInfo = _i1.createRelationTable(
      relationFieldName: 'userInfo',
      field: DashboardWidget.t.userInfoId,
      foreignField: _i5.UserInfo.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.UserInfoTable(tableRelation: foreignTableRelation),
    );
    return _userInfo!;
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
    userInfoId,
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
    if (relationField == 'userInfo') {
      return userInfo;
    }
    return null;
  }
}

class DashboardWidgetInclude extends _i1.IncludeObject {
  DashboardWidgetInclude._({
    _i3.DeviceInclude? device,
    _i4.DashboardInclude? dashboard,
    _i5.UserInfoInclude? userInfo,
  }) {
    _device = device;
    _dashboard = dashboard;
    _userInfo = userInfo;
  }

  _i3.DeviceInclude? _device;

  _i4.DashboardInclude? _dashboard;

  _i5.UserInfoInclude? _userInfo;

  @override
  Map<String, _i1.Include?> get includes => {
    'device': _device,
    'dashboard': _dashboard,
    'userInfo': _userInfo,
  };

  @override
  _i1.Table<int?> get table => DashboardWidget.t;
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
  _i1.Table<int?> get table => DashboardWidget.t;
}

class DashboardWidgetRepository {
  const DashboardWidgetRepository._();

  final attachRow = const DashboardWidgetAttachRowRepository._();

  /// Returns a list of [DashboardWidget]s matching the given query parameters.
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

  /// Returns the first matching [DashboardWidget] matching the given query parameters.
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

  /// Finds a single [DashboardWidget] by its [id] or null if no such row exists.
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

  /// Inserts all [DashboardWidget]s in the list and returns the inserted rows.
  ///
  /// The returned [DashboardWidget]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
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

  /// Inserts a single [DashboardWidget] and returns the inserted row.
  ///
  /// The returned [DashboardWidget] will have its `id` field set.
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

  /// Updates all [DashboardWidget]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
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

  /// Updates a single [DashboardWidget]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
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

  /// Updates a single [DashboardWidget] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<DashboardWidget?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<DashboardWidgetUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<DashboardWidget>(
      id,
      columnValues: columnValues(DashboardWidget.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [DashboardWidget]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<DashboardWidget>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<DashboardWidgetUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<DashboardWidgetTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DashboardWidgetTable>? orderBy,
    _i1.OrderByListBuilder<DashboardWidgetTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<DashboardWidget>(
      columnValues: columnValues(DashboardWidget.t.updateTable),
      where: where(DashboardWidget.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DashboardWidget.t),
      orderByList: orderByList?.call(DashboardWidget.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [DashboardWidget]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
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

  /// Deletes a single [DashboardWidget].
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

  /// Deletes all rows matching the [where] expression.
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

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
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

  /// Creates a relation between the given [DashboardWidget] and [Device]
  /// by setting the [DashboardWidget]'s foreign key `deviceId` to refer to the [Device].
  Future<void> device(
    _i1.Session session,
    DashboardWidget dashboardWidget,
    _i3.Device device, {
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

  /// Creates a relation between the given [DashboardWidget] and [Dashboard]
  /// by setting the [DashboardWidget]'s foreign key `dashboardId` to refer to the [Dashboard].
  Future<void> dashboard(
    _i1.Session session,
    DashboardWidget dashboardWidget,
    _i4.Dashboard dashboard, {
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

  /// Creates a relation between the given [DashboardWidget] and [UserInfo]
  /// by setting the [DashboardWidget]'s foreign key `userInfoId` to refer to the [UserInfo].
  Future<void> userInfo(
    _i1.Session session,
    DashboardWidget dashboardWidget,
    _i5.UserInfo userInfo, {
    _i1.Transaction? transaction,
  }) async {
    if (dashboardWidget.id == null) {
      throw ArgumentError.notNull('dashboardWidget.id');
    }
    if (userInfo.id == null) {
      throw ArgumentError.notNull('userInfo.id');
    }

    var $dashboardWidget = dashboardWidget.copyWith(userInfoId: userInfo.id);
    await session.db.updateRow<DashboardWidget>(
      $dashboardWidget,
      columns: [DashboardWidget.t.userInfoId],
      transaction: transaction,
    );
  }
}
