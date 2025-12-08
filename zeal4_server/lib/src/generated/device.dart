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
import 'device_log.dart' as _i3;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i4;
import 'package:zeal4_server/src/generated/protocol.dart' as _i5;

abstract class Device implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = DeviceTable();

  static const db = DeviceRepository._();

  @override
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

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Device',
      if (id != null) 'id': id,
      'uuid': uuid,
      'name': name,
      'description': description,
      if (fields != null) 'fields': fields?.toJson(),
      if (widget != null)
        'widget': widget?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (deviceLog != null)
        'deviceLog': deviceLog?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
      'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJsonForProtocol(),
      'created': created.toJson(),
    };
  }

  static DeviceInclude include({
    _i2.DashboardWidgetIncludeList? widget,
    _i3.DeviceLogIncludeList? deviceLog,
    _i4.UserInfoInclude? userInfo,
  }) {
    return DeviceInclude._(
      widget: widget,
      deviceLog: deviceLog,
      userInfo: userInfo,
    );
  }

  static DeviceIncludeList includeList({
    _i1.WhereExpressionBuilder<DeviceTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DeviceTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DeviceTable>? orderByList,
    DeviceInclude? include,
  }) {
    return DeviceIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Device.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Device.t),
      include: include,
    );
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

class DeviceUpdateTable extends _i1.UpdateTable<DeviceTable> {
  DeviceUpdateTable(super.table);

  _i1.ColumnValue<String, String> uuid(String value) => _i1.ColumnValue(
    table.uuid,
    value,
  );

  _i1.ColumnValue<String, String> name(String value) => _i1.ColumnValue(
    table.name,
    value,
  );

  _i1.ColumnValue<String, String> description(String value) => _i1.ColumnValue(
    table.description,
    value,
  );

  _i1.ColumnValue<List<String>, List<String>> fields(List<String>? value) =>
      _i1.ColumnValue(
        table.fields,
        value,
      );

  _i1.ColumnValue<int, int> userInfoId(int value) => _i1.ColumnValue(
    table.userInfoId,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> created(DateTime value) =>
      _i1.ColumnValue(
        table.created,
        value,
      );
}

class DeviceTable extends _i1.Table<int?> {
  DeviceTable({super.tableRelation}) : super(tableName: 'device') {
    updateTable = DeviceUpdateTable(this);
    uuid = _i1.ColumnString(
      'uuid',
      this,
    );
    name = _i1.ColumnString(
      'name',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    fields = _i1.ColumnSerializable<List<String>>(
      'fields',
      this,
    );
    userInfoId = _i1.ColumnInt(
      'userInfoId',
      this,
    );
    created = _i1.ColumnDateTime(
      'created',
      this,
      hasDefault: true,
    );
  }

  late final DeviceUpdateTable updateTable;

  late final _i1.ColumnString uuid;

  late final _i1.ColumnString name;

  late final _i1.ColumnString description;

  late final _i1.ColumnSerializable<List<String>> fields;

  _i2.DashboardWidgetTable? ___widget;

  _i1.ManyRelation<_i2.DashboardWidgetTable>? _widget;

  _i3.DeviceLogTable? ___deviceLog;

  _i1.ManyRelation<_i3.DeviceLogTable>? _deviceLog;

  late final _i1.ColumnInt userInfoId;

  _i4.UserInfoTable? _userInfo;

  late final _i1.ColumnDateTime created;

  _i2.DashboardWidgetTable get __widget {
    if (___widget != null) return ___widget!;
    ___widget = _i1.createRelationTable(
      relationFieldName: '__widget',
      field: Device.t.id,
      foreignField: _i2.DashboardWidget.t.deviceId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.DashboardWidgetTable(tableRelation: foreignTableRelation),
    );
    return ___widget!;
  }

  _i3.DeviceLogTable get __deviceLog {
    if (___deviceLog != null) return ___deviceLog!;
    ___deviceLog = _i1.createRelationTable(
      relationFieldName: '__deviceLog',
      field: Device.t.id,
      foreignField: _i3.DeviceLog.t.deviceId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.DeviceLogTable(tableRelation: foreignTableRelation),
    );
    return ___deviceLog!;
  }

  _i4.UserInfoTable get userInfo {
    if (_userInfo != null) return _userInfo!;
    _userInfo = _i1.createRelationTable(
      relationFieldName: 'userInfo',
      field: Device.t.userInfoId,
      foreignField: _i4.UserInfo.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.UserInfoTable(tableRelation: foreignTableRelation),
    );
    return _userInfo!;
  }

  _i1.ManyRelation<_i2.DashboardWidgetTable> get widget {
    if (_widget != null) return _widget!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'widget',
      field: Device.t.id,
      foreignField: _i2.DashboardWidget.t.deviceId,
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

  _i1.ManyRelation<_i3.DeviceLogTable> get deviceLog {
    if (_deviceLog != null) return _deviceLog!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'deviceLog',
      field: Device.t.id,
      foreignField: _i3.DeviceLog.t.deviceId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.DeviceLogTable(tableRelation: foreignTableRelation),
    );
    _deviceLog = _i1.ManyRelation<_i3.DeviceLogTable>(
      tableWithRelations: relationTable,
      table: _i3.DeviceLogTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _deviceLog!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    uuid,
    name,
    description,
    fields,
    userInfoId,
    created,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'widget') {
      return __widget;
    }
    if (relationField == 'deviceLog') {
      return __deviceLog;
    }
    if (relationField == 'userInfo') {
      return userInfo;
    }
    return null;
  }
}

class DeviceInclude extends _i1.IncludeObject {
  DeviceInclude._({
    _i2.DashboardWidgetIncludeList? widget,
    _i3.DeviceLogIncludeList? deviceLog,
    _i4.UserInfoInclude? userInfo,
  }) {
    _widget = widget;
    _deviceLog = deviceLog;
    _userInfo = userInfo;
  }

  _i2.DashboardWidgetIncludeList? _widget;

  _i3.DeviceLogIncludeList? _deviceLog;

  _i4.UserInfoInclude? _userInfo;

  @override
  Map<String, _i1.Include?> get includes => {
    'widget': _widget,
    'deviceLog': _deviceLog,
    'userInfo': _userInfo,
  };

  @override
  _i1.Table<int?> get table => Device.t;
}

class DeviceIncludeList extends _i1.IncludeList {
  DeviceIncludeList._({
    _i1.WhereExpressionBuilder<DeviceTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Device.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Device.t;
}

class DeviceRepository {
  const DeviceRepository._();

  final attach = const DeviceAttachRepository._();

  final attachRow = const DeviceAttachRowRepository._();

  final detach = const DeviceDetachRepository._();

  final detachRow = const DeviceDetachRowRepository._();

  /// Returns a list of [Device]s matching the given query parameters.
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
  Future<List<Device>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DeviceTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DeviceTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DeviceTable>? orderByList,
    _i1.Transaction? transaction,
    DeviceInclude? include,
  }) async {
    return session.db.find<Device>(
      where: where?.call(Device.t),
      orderBy: orderBy?.call(Device.t),
      orderByList: orderByList?.call(Device.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Device] matching the given query parameters.
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
  Future<Device?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DeviceTable>? where,
    int? offset,
    _i1.OrderByBuilder<DeviceTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DeviceTable>? orderByList,
    _i1.Transaction? transaction,
    DeviceInclude? include,
  }) async {
    return session.db.findFirstRow<Device>(
      where: where?.call(Device.t),
      orderBy: orderBy?.call(Device.t),
      orderByList: orderByList?.call(Device.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Device] by its [id] or null if no such row exists.
  Future<Device?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    DeviceInclude? include,
  }) async {
    return session.db.findById<Device>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Device]s in the list and returns the inserted rows.
  ///
  /// The returned [Device]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Device>> insert(
    _i1.Session session,
    List<Device> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Device>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Device] and returns the inserted row.
  ///
  /// The returned [Device] will have its `id` field set.
  Future<Device> insertRow(
    _i1.Session session,
    Device row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Device>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Device]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Device>> update(
    _i1.Session session,
    List<Device> rows, {
    _i1.ColumnSelections<DeviceTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Device>(
      rows,
      columns: columns?.call(Device.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Device]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Device> updateRow(
    _i1.Session session,
    Device row, {
    _i1.ColumnSelections<DeviceTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Device>(
      row,
      columns: columns?.call(Device.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Device] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Device?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<DeviceUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Device>(
      id,
      columnValues: columnValues(Device.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Device]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Device>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<DeviceUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<DeviceTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DeviceTable>? orderBy,
    _i1.OrderByListBuilder<DeviceTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Device>(
      columnValues: columnValues(Device.t.updateTable),
      where: where(Device.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Device.t),
      orderByList: orderByList?.call(Device.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Device]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Device>> delete(
    _i1.Session session,
    List<Device> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Device>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Device].
  Future<Device> deleteRow(
    _i1.Session session,
    Device row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Device>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Device>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<DeviceTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Device>(
      where: where(Device.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DeviceTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Device>(
      where: where?.call(Device.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class DeviceAttachRepository {
  const DeviceAttachRepository._();

  /// Creates a relation between this [Device] and the given [DashboardWidget]s
  /// by setting each [DashboardWidget]'s foreign key `deviceId` to refer to this [Device].
  Future<void> widget(
    _i1.Session session,
    Device device,
    List<_i2.DashboardWidget> dashboardWidget, {
    _i1.Transaction? transaction,
  }) async {
    if (dashboardWidget.any((e) => e.id == null)) {
      throw ArgumentError.notNull('dashboardWidget.id');
    }
    if (device.id == null) {
      throw ArgumentError.notNull('device.id');
    }

    var $dashboardWidget = dashboardWidget
        .map((e) => e.copyWith(deviceId: device.id))
        .toList();
    await session.db.update<_i2.DashboardWidget>(
      $dashboardWidget,
      columns: [_i2.DashboardWidget.t.deviceId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Device] and the given [DeviceLog]s
  /// by setting each [DeviceLog]'s foreign key `deviceId` to refer to this [Device].
  Future<void> deviceLog(
    _i1.Session session,
    Device device,
    List<_i3.DeviceLog> deviceLog, {
    _i1.Transaction? transaction,
  }) async {
    if (deviceLog.any((e) => e.id == null)) {
      throw ArgumentError.notNull('deviceLog.id');
    }
    if (device.id == null) {
      throw ArgumentError.notNull('device.id');
    }

    var $deviceLog = deviceLog
        .map((e) => e.copyWith(deviceId: device.id))
        .toList();
    await session.db.update<_i3.DeviceLog>(
      $deviceLog,
      columns: [_i3.DeviceLog.t.deviceId],
      transaction: transaction,
    );
  }
}

class DeviceAttachRowRepository {
  const DeviceAttachRowRepository._();

  /// Creates a relation between the given [Device] and [UserInfo]
  /// by setting the [Device]'s foreign key `userInfoId` to refer to the [UserInfo].
  Future<void> userInfo(
    _i1.Session session,
    Device device,
    _i4.UserInfo userInfo, {
    _i1.Transaction? transaction,
  }) async {
    if (device.id == null) {
      throw ArgumentError.notNull('device.id');
    }
    if (userInfo.id == null) {
      throw ArgumentError.notNull('userInfo.id');
    }

    var $device = device.copyWith(userInfoId: userInfo.id);
    await session.db.updateRow<Device>(
      $device,
      columns: [Device.t.userInfoId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Device] and the given [DashboardWidget]
  /// by setting the [DashboardWidget]'s foreign key `deviceId` to refer to this [Device].
  Future<void> widget(
    _i1.Session session,
    Device device,
    _i2.DashboardWidget dashboardWidget, {
    _i1.Transaction? transaction,
  }) async {
    if (dashboardWidget.id == null) {
      throw ArgumentError.notNull('dashboardWidget.id');
    }
    if (device.id == null) {
      throw ArgumentError.notNull('device.id');
    }

    var $dashboardWidget = dashboardWidget.copyWith(deviceId: device.id);
    await session.db.updateRow<_i2.DashboardWidget>(
      $dashboardWidget,
      columns: [_i2.DashboardWidget.t.deviceId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Device] and the given [DeviceLog]
  /// by setting the [DeviceLog]'s foreign key `deviceId` to refer to this [Device].
  Future<void> deviceLog(
    _i1.Session session,
    Device device,
    _i3.DeviceLog deviceLog, {
    _i1.Transaction? transaction,
  }) async {
    if (deviceLog.id == null) {
      throw ArgumentError.notNull('deviceLog.id');
    }
    if (device.id == null) {
      throw ArgumentError.notNull('device.id');
    }

    var $deviceLog = deviceLog.copyWith(deviceId: device.id);
    await session.db.updateRow<_i3.DeviceLog>(
      $deviceLog,
      columns: [_i3.DeviceLog.t.deviceId],
      transaction: transaction,
    );
  }
}

class DeviceDetachRepository {
  const DeviceDetachRepository._();

  /// Detaches the relation between this [Device] and the given [DashboardWidget]
  /// by setting the [DashboardWidget]'s foreign key `deviceId` to `null`.
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
        .map((e) => e.copyWith(deviceId: null))
        .toList();
    await session.db.update<_i2.DashboardWidget>(
      $dashboardWidget,
      columns: [_i2.DashboardWidget.t.deviceId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [Device] and the given [DeviceLog]
  /// by setting the [DeviceLog]'s foreign key `deviceId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> deviceLog(
    _i1.Session session,
    List<_i3.DeviceLog> deviceLog, {
    _i1.Transaction? transaction,
  }) async {
    if (deviceLog.any((e) => e.id == null)) {
      throw ArgumentError.notNull('deviceLog.id');
    }

    var $deviceLog = deviceLog.map((e) => e.copyWith(deviceId: null)).toList();
    await session.db.update<_i3.DeviceLog>(
      $deviceLog,
      columns: [_i3.DeviceLog.t.deviceId],
      transaction: transaction,
    );
  }
}

class DeviceDetachRowRepository {
  const DeviceDetachRowRepository._();

  /// Detaches the relation between this [Device] and the given [DashboardWidget]
  /// by setting the [DashboardWidget]'s foreign key `deviceId` to `null`.
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

    var $dashboardWidget = dashboardWidget.copyWith(deviceId: null);
    await session.db.updateRow<_i2.DashboardWidget>(
      $dashboardWidget,
      columns: [_i2.DashboardWidget.t.deviceId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [Device] and the given [DeviceLog]
  /// by setting the [DeviceLog]'s foreign key `deviceId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> deviceLog(
    _i1.Session session,
    _i3.DeviceLog deviceLog, {
    _i1.Transaction? transaction,
  }) async {
    if (deviceLog.id == null) {
      throw ArgumentError.notNull('deviceLog.id');
    }

    var $deviceLog = deviceLog.copyWith(deviceId: null);
    await session.db.updateRow<_i3.DeviceLog>(
      $deviceLog,
      columns: [_i3.DeviceLog.t.deviceId],
      transaction: transaction,
    );
  }
}
