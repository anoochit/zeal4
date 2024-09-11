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

abstract class Device extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  Device._({
    int? id,
    required this.uuid,
    required this.name,
    required this.description,
    DateTime? created,
    this.deviceLog,
  })  : created = created ?? DateTime.now(),
        super(id);

  factory Device({
    int? id,
    required _i1.UuidValue uuid,
    required String name,
    required String description,
    DateTime? created,
    List<_i2.DeviceLog>? deviceLog,
  }) = _DeviceImpl;

  factory Device.fromJson(Map<String, dynamic> jsonSerialization) {
    return Device(
      id: jsonSerialization['id'] as int?,
      uuid: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['uuid']),
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String,
      created: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['created']),
      deviceLog: (jsonSerialization['deviceLog'] as List?)
          ?.map((e) => _i2.DeviceLog.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  static final t = DeviceTable();

  static const db = DeviceRepository._();

  _i1.UuidValue uuid;

  String name;

  String description;

  DateTime created;

  List<_i2.DeviceLog>? deviceLog;

  @override
  _i1.Table get table => t;

  Device copyWith({
    int? id,
    _i1.UuidValue? uuid,
    String? name,
    String? description,
    DateTime? created,
    List<_i2.DeviceLog>? deviceLog,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'uuid': uuid.toJson(),
      'name': name,
      'description': description,
      'created': created.toJson(),
      if (deviceLog != null)
        'deviceLog': deviceLog?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'uuid': uuid.toJson(),
      'name': name,
      'description': description,
      'created': created.toJson(),
      if (deviceLog != null)
        'deviceLog':
            deviceLog?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  static DeviceInclude include({_i2.DeviceLogIncludeList? deviceLog}) {
    return DeviceInclude._(deviceLog: deviceLog);
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
    required _i1.UuidValue uuid,
    required String name,
    required String description,
    DateTime? created,
    List<_i2.DeviceLog>? deviceLog,
  }) : super._(
          id: id,
          uuid: uuid,
          name: name,
          description: description,
          created: created,
          deviceLog: deviceLog,
        );

  @override
  Device copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? uuid,
    String? name,
    String? description,
    DateTime? created,
    Object? deviceLog = _Undefined,
  }) {
    return Device(
      id: id is int? ? id : this.id,
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      description: description ?? this.description,
      created: created ?? this.created,
      deviceLog: deviceLog is List<_i2.DeviceLog>?
          ? deviceLog
          : this.deviceLog?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

class DeviceTable extends _i1.Table {
  DeviceTable({super.tableRelation}) : super(tableName: 'device') {
    uuid = _i1.ColumnUuid(
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
    created = _i1.ColumnDateTime(
      'created',
      this,
      hasDefault: true,
    );
  }

  late final _i1.ColumnUuid uuid;

  late final _i1.ColumnString name;

  late final _i1.ColumnString description;

  late final _i1.ColumnDateTime created;

  _i2.DeviceLogTable? ___deviceLog;

  _i1.ManyRelation<_i2.DeviceLogTable>? _deviceLog;

  _i2.DeviceLogTable get __deviceLog {
    if (___deviceLog != null) return ___deviceLog!;
    ___deviceLog = _i1.createRelationTable(
      relationFieldName: '__deviceLog',
      field: Device.t.id,
      foreignField: _i2.DeviceLog.t.deviceId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.DeviceLogTable(tableRelation: foreignTableRelation),
    );
    return ___deviceLog!;
  }

  _i1.ManyRelation<_i2.DeviceLogTable> get deviceLog {
    if (_deviceLog != null) return _deviceLog!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'deviceLog',
      field: Device.t.id,
      foreignField: _i2.DeviceLog.t.deviceId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.DeviceLogTable(tableRelation: foreignTableRelation),
    );
    _deviceLog = _i1.ManyRelation<_i2.DeviceLogTable>(
      tableWithRelations: relationTable,
      table: _i2.DeviceLogTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _deviceLog!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        uuid,
        name,
        description,
        created,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'deviceLog') {
      return __deviceLog;
    }
    return null;
  }
}

class DeviceInclude extends _i1.IncludeObject {
  DeviceInclude._({_i2.DeviceLogIncludeList? deviceLog}) {
    _deviceLog = deviceLog;
  }

  _i2.DeviceLogIncludeList? _deviceLog;

  @override
  Map<String, _i1.Include?> get includes => {'deviceLog': _deviceLog};

  @override
  _i1.Table get table => Device.t;
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
  _i1.Table get table => Device.t;
}

class DeviceRepository {
  const DeviceRepository._();

  final attach = const DeviceAttachRepository._();

  final attachRow = const DeviceAttachRowRepository._();

  final detach = const DeviceDetachRepository._();

  final detachRow = const DeviceDetachRowRepository._();

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

  Future<void> deviceLog(
    _i1.Session session,
    Device device,
    List<_i2.DeviceLog> deviceLog, {
    _i1.Transaction? transaction,
  }) async {
    if (deviceLog.any((e) => e.id == null)) {
      throw ArgumentError.notNull('deviceLog.id');
    }
    if (device.id == null) {
      throw ArgumentError.notNull('device.id');
    }

    var $deviceLog =
        deviceLog.map((e) => e.copyWith(deviceId: device.id)).toList();
    await session.db.update<_i2.DeviceLog>(
      $deviceLog,
      columns: [_i2.DeviceLog.t.deviceId],
      transaction: transaction,
    );
  }
}

class DeviceAttachRowRepository {
  const DeviceAttachRowRepository._();

  Future<void> deviceLog(
    _i1.Session session,
    Device device,
    _i2.DeviceLog deviceLog, {
    _i1.Transaction? transaction,
  }) async {
    if (deviceLog.id == null) {
      throw ArgumentError.notNull('deviceLog.id');
    }
    if (device.id == null) {
      throw ArgumentError.notNull('device.id');
    }

    var $deviceLog = deviceLog.copyWith(deviceId: device.id);
    await session.db.updateRow<_i2.DeviceLog>(
      $deviceLog,
      columns: [_i2.DeviceLog.t.deviceId],
      transaction: transaction,
    );
  }
}

class DeviceDetachRepository {
  const DeviceDetachRepository._();

  Future<void> deviceLog(
    _i1.Session session,
    List<_i2.DeviceLog> deviceLog, {
    _i1.Transaction? transaction,
  }) async {
    if (deviceLog.any((e) => e.id == null)) {
      throw ArgumentError.notNull('deviceLog.id');
    }

    var $deviceLog = deviceLog.map((e) => e.copyWith(deviceId: null)).toList();
    await session.db.update<_i2.DeviceLog>(
      $deviceLog,
      columns: [_i2.DeviceLog.t.deviceId],
      transaction: transaction,
    );
  }
}

class DeviceDetachRowRepository {
  const DeviceDetachRowRepository._();

  Future<void> deviceLog(
    _i1.Session session,
    _i2.DeviceLog deviceLog, {
    _i1.Transaction? transaction,
  }) async {
    if (deviceLog.id == null) {
      throw ArgumentError.notNull('deviceLog.id');
    }

    var $deviceLog = deviceLog.copyWith(deviceId: null);
    await session.db.updateRow<_i2.DeviceLog>(
      $deviceLog,
      columns: [_i2.DeviceLog.t.deviceId],
      transaction: transaction,
    );
  }
}
