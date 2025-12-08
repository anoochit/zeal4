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
import 'device.dart' as _i2;
import 'package:zeal4_server/src/generated/protocol.dart' as _i3;

abstract class DeviceLog
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  DeviceLog._({
    this.id,
    DateTime? created,
    required this.message,
    required this.deviceId,
    this.device,
  }) : created = created ?? DateTime.now();

  factory DeviceLog({
    int? id,
    DateTime? created,
    required String message,
    required int deviceId,
    _i2.Device? device,
  }) = _DeviceLogImpl;

  factory DeviceLog.fromJson(Map<String, dynamic> jsonSerialization) {
    return DeviceLog(
      id: jsonSerialization['id'] as int?,
      created: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['created']),
      message: jsonSerialization['message'] as String,
      deviceId: jsonSerialization['deviceId'] as int,
      device: jsonSerialization['device'] == null
          ? null
          : _i3.Protocol().deserialize<_i2.Device>(jsonSerialization['device']),
    );
  }

  static final t = DeviceLogTable();

  static const db = DeviceLogRepository._();

  @override
  int? id;

  DateTime created;

  String message;

  int deviceId;

  _i2.Device? device;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [DeviceLog]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DeviceLog copyWith({
    int? id,
    DateTime? created,
    String? message,
    int? deviceId,
    _i2.Device? device,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'DeviceLog',
      if (id != null) 'id': id,
      'created': created.toJson(),
      'message': message,
      'deviceId': deviceId,
      if (device != null) 'device': device?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'DeviceLog',
      if (id != null) 'id': id,
      'created': created.toJson(),
      'message': message,
      'deviceId': deviceId,
      if (device != null) 'device': device?.toJsonForProtocol(),
    };
  }

  static DeviceLogInclude include({_i2.DeviceInclude? device}) {
    return DeviceLogInclude._(device: device);
  }

  static DeviceLogIncludeList includeList({
    _i1.WhereExpressionBuilder<DeviceLogTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DeviceLogTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DeviceLogTable>? orderByList,
    DeviceLogInclude? include,
  }) {
    return DeviceLogIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DeviceLog.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(DeviceLog.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DeviceLogImpl extends DeviceLog {
  _DeviceLogImpl({
    int? id,
    DateTime? created,
    required String message,
    required int deviceId,
    _i2.Device? device,
  }) : super._(
         id: id,
         created: created,
         message: message,
         deviceId: deviceId,
         device: device,
       );

  /// Returns a shallow copy of this [DeviceLog]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DeviceLog copyWith({
    Object? id = _Undefined,
    DateTime? created,
    String? message,
    int? deviceId,
    Object? device = _Undefined,
  }) {
    return DeviceLog(
      id: id is int? ? id : this.id,
      created: created ?? this.created,
      message: message ?? this.message,
      deviceId: deviceId ?? this.deviceId,
      device: device is _i2.Device? ? device : this.device?.copyWith(),
    );
  }
}

class DeviceLogUpdateTable extends _i1.UpdateTable<DeviceLogTable> {
  DeviceLogUpdateTable(super.table);

  _i1.ColumnValue<DateTime, DateTime> created(DateTime value) =>
      _i1.ColumnValue(
        table.created,
        value,
      );

  _i1.ColumnValue<String, String> message(String value) => _i1.ColumnValue(
    table.message,
    value,
  );

  _i1.ColumnValue<int, int> deviceId(int value) => _i1.ColumnValue(
    table.deviceId,
    value,
  );
}

class DeviceLogTable extends _i1.Table<int?> {
  DeviceLogTable({super.tableRelation}) : super(tableName: 'device_log') {
    updateTable = DeviceLogUpdateTable(this);
    created = _i1.ColumnDateTime(
      'created',
      this,
      hasDefault: true,
    );
    message = _i1.ColumnString(
      'message',
      this,
    );
    deviceId = _i1.ColumnInt(
      'deviceId',
      this,
    );
  }

  late final DeviceLogUpdateTable updateTable;

  late final _i1.ColumnDateTime created;

  late final _i1.ColumnString message;

  late final _i1.ColumnInt deviceId;

  _i2.DeviceTable? _device;

  _i2.DeviceTable get device {
    if (_device != null) return _device!;
    _device = _i1.createRelationTable(
      relationFieldName: 'device',
      field: DeviceLog.t.deviceId,
      foreignField: _i2.Device.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.DeviceTable(tableRelation: foreignTableRelation),
    );
    return _device!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    created,
    message,
    deviceId,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'device') {
      return device;
    }
    return null;
  }
}

class DeviceLogInclude extends _i1.IncludeObject {
  DeviceLogInclude._({_i2.DeviceInclude? device}) {
    _device = device;
  }

  _i2.DeviceInclude? _device;

  @override
  Map<String, _i1.Include?> get includes => {'device': _device};

  @override
  _i1.Table<int?> get table => DeviceLog.t;
}

class DeviceLogIncludeList extends _i1.IncludeList {
  DeviceLogIncludeList._({
    _i1.WhereExpressionBuilder<DeviceLogTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(DeviceLog.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => DeviceLog.t;
}

class DeviceLogRepository {
  const DeviceLogRepository._();

  final attachRow = const DeviceLogAttachRowRepository._();

  /// Returns a list of [DeviceLog]s matching the given query parameters.
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
  Future<List<DeviceLog>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DeviceLogTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DeviceLogTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DeviceLogTable>? orderByList,
    _i1.Transaction? transaction,
    DeviceLogInclude? include,
  }) async {
    return session.db.find<DeviceLog>(
      where: where?.call(DeviceLog.t),
      orderBy: orderBy?.call(DeviceLog.t),
      orderByList: orderByList?.call(DeviceLog.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [DeviceLog] matching the given query parameters.
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
  Future<DeviceLog?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DeviceLogTable>? where,
    int? offset,
    _i1.OrderByBuilder<DeviceLogTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DeviceLogTable>? orderByList,
    _i1.Transaction? transaction,
    DeviceLogInclude? include,
  }) async {
    return session.db.findFirstRow<DeviceLog>(
      where: where?.call(DeviceLog.t),
      orderBy: orderBy?.call(DeviceLog.t),
      orderByList: orderByList?.call(DeviceLog.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [DeviceLog] by its [id] or null if no such row exists.
  Future<DeviceLog?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    DeviceLogInclude? include,
  }) async {
    return session.db.findById<DeviceLog>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [DeviceLog]s in the list and returns the inserted rows.
  ///
  /// The returned [DeviceLog]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<DeviceLog>> insert(
    _i1.Session session,
    List<DeviceLog> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<DeviceLog>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [DeviceLog] and returns the inserted row.
  ///
  /// The returned [DeviceLog] will have its `id` field set.
  Future<DeviceLog> insertRow(
    _i1.Session session,
    DeviceLog row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<DeviceLog>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [DeviceLog]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<DeviceLog>> update(
    _i1.Session session,
    List<DeviceLog> rows, {
    _i1.ColumnSelections<DeviceLogTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<DeviceLog>(
      rows,
      columns: columns?.call(DeviceLog.t),
      transaction: transaction,
    );
  }

  /// Updates a single [DeviceLog]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<DeviceLog> updateRow(
    _i1.Session session,
    DeviceLog row, {
    _i1.ColumnSelections<DeviceLogTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<DeviceLog>(
      row,
      columns: columns?.call(DeviceLog.t),
      transaction: transaction,
    );
  }

  /// Updates a single [DeviceLog] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<DeviceLog?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<DeviceLogUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<DeviceLog>(
      id,
      columnValues: columnValues(DeviceLog.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [DeviceLog]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<DeviceLog>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<DeviceLogUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<DeviceLogTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DeviceLogTable>? orderBy,
    _i1.OrderByListBuilder<DeviceLogTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<DeviceLog>(
      columnValues: columnValues(DeviceLog.t.updateTable),
      where: where(DeviceLog.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DeviceLog.t),
      orderByList: orderByList?.call(DeviceLog.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [DeviceLog]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<DeviceLog>> delete(
    _i1.Session session,
    List<DeviceLog> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<DeviceLog>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [DeviceLog].
  Future<DeviceLog> deleteRow(
    _i1.Session session,
    DeviceLog row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<DeviceLog>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<DeviceLog>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<DeviceLogTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<DeviceLog>(
      where: where(DeviceLog.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DeviceLogTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<DeviceLog>(
      where: where?.call(DeviceLog.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class DeviceLogAttachRowRepository {
  const DeviceLogAttachRowRepository._();

  /// Creates a relation between the given [DeviceLog] and [Device]
  /// by setting the [DeviceLog]'s foreign key `deviceId` to refer to the [Device].
  Future<void> device(
    _i1.Session session,
    DeviceLog deviceLog,
    _i2.Device device, {
    _i1.Transaction? transaction,
  }) async {
    if (deviceLog.id == null) {
      throw ArgumentError.notNull('deviceLog.id');
    }
    if (device.id == null) {
      throw ArgumentError.notNull('device.id');
    }

    var $deviceLog = deviceLog.copyWith(deviceId: device.id);
    await session.db.updateRow<DeviceLog>(
      $deviceLog,
      columns: [DeviceLog.t.deviceId],
      transaction: transaction,
    );
  }
}
