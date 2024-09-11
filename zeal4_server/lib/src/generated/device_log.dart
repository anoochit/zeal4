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

abstract class DeviceLog extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  DeviceLog._({
    int? id,
    DateTime? created,
    required this.message,
    required this.deviceId,
    this.device,
  })  : created = created ?? DateTime.now(),
        super(id);

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
          : _i2.Device.fromJson(
              (jsonSerialization['device'] as Map<String, dynamic>)),
    );
  }

  static final t = DeviceLogTable();

  static const db = DeviceLogRepository._();

  DateTime created;

  String message;

  int deviceId;

  _i2.Device? device;

  @override
  _i1.Table get table => t;

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

class DeviceLogTable extends _i1.Table {
  DeviceLogTable({super.tableRelation}) : super(tableName: 'device_log') {
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
  _i1.Table get table => DeviceLog.t;
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
  _i1.Table get table => DeviceLog.t;
}

class DeviceLogRepository {
  const DeviceLogRepository._();

  final attachRow = const DeviceLogAttachRowRepository._();

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
