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

abstract class DeviceFields extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  DeviceFields._({
    int? id,
    required this.field,
    required this.type,
    required this.deviceId,
    this.device,
  }) : super(id);

  factory DeviceFields({
    int? id,
    required String field,
    required String type,
    required int deviceId,
    _i2.Device? device,
  }) = _DeviceFieldsImpl;

  factory DeviceFields.fromJson(Map<String, dynamic> jsonSerialization) {
    return DeviceFields(
      id: jsonSerialization['id'] as int?,
      field: jsonSerialization['field'] as String,
      type: jsonSerialization['type'] as String,
      deviceId: jsonSerialization['deviceId'] as int,
      device: jsonSerialization['device'] == null
          ? null
          : _i2.Device.fromJson(
              (jsonSerialization['device'] as Map<String, dynamic>)),
    );
  }

  static final t = DeviceFieldsTable();

  static const db = DeviceFieldsRepository._();

  String field;

  String type;

  int deviceId;

  _i2.Device? device;

  @override
  _i1.Table get table => t;

  DeviceFields copyWith({
    int? id,
    String? field,
    String? type,
    int? deviceId,
    _i2.Device? device,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'field': field,
      'type': type,
      'deviceId': deviceId,
      if (device != null) 'device': device?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'field': field,
      'type': type,
      'deviceId': deviceId,
      if (device != null) 'device': device?.toJsonForProtocol(),
    };
  }

  static DeviceFieldsInclude include({_i2.DeviceInclude? device}) {
    return DeviceFieldsInclude._(device: device);
  }

  static DeviceFieldsIncludeList includeList({
    _i1.WhereExpressionBuilder<DeviceFieldsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DeviceFieldsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DeviceFieldsTable>? orderByList,
    DeviceFieldsInclude? include,
  }) {
    return DeviceFieldsIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DeviceFields.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(DeviceFields.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DeviceFieldsImpl extends DeviceFields {
  _DeviceFieldsImpl({
    int? id,
    required String field,
    required String type,
    required int deviceId,
    _i2.Device? device,
  }) : super._(
          id: id,
          field: field,
          type: type,
          deviceId: deviceId,
          device: device,
        );

  @override
  DeviceFields copyWith({
    Object? id = _Undefined,
    String? field,
    String? type,
    int? deviceId,
    Object? device = _Undefined,
  }) {
    return DeviceFields(
      id: id is int? ? id : this.id,
      field: field ?? this.field,
      type: type ?? this.type,
      deviceId: deviceId ?? this.deviceId,
      device: device is _i2.Device? ? device : this.device?.copyWith(),
    );
  }
}

class DeviceFieldsTable extends _i1.Table {
  DeviceFieldsTable({super.tableRelation}) : super(tableName: 'device_fields') {
    field = _i1.ColumnString(
      'field',
      this,
    );
    type = _i1.ColumnString(
      'type',
      this,
    );
    deviceId = _i1.ColumnInt(
      'deviceId',
      this,
    );
  }

  late final _i1.ColumnString field;

  late final _i1.ColumnString type;

  late final _i1.ColumnInt deviceId;

  _i2.DeviceTable? _device;

  _i2.DeviceTable get device {
    if (_device != null) return _device!;
    _device = _i1.createRelationTable(
      relationFieldName: 'device',
      field: DeviceFields.t.deviceId,
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
        field,
        type,
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

class DeviceFieldsInclude extends _i1.IncludeObject {
  DeviceFieldsInclude._({_i2.DeviceInclude? device}) {
    _device = device;
  }

  _i2.DeviceInclude? _device;

  @override
  Map<String, _i1.Include?> get includes => {'device': _device};

  @override
  _i1.Table get table => DeviceFields.t;
}

class DeviceFieldsIncludeList extends _i1.IncludeList {
  DeviceFieldsIncludeList._({
    _i1.WhereExpressionBuilder<DeviceFieldsTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(DeviceFields.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => DeviceFields.t;
}

class DeviceFieldsRepository {
  const DeviceFieldsRepository._();

  final attachRow = const DeviceFieldsAttachRowRepository._();

  Future<List<DeviceFields>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DeviceFieldsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DeviceFieldsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DeviceFieldsTable>? orderByList,
    _i1.Transaction? transaction,
    DeviceFieldsInclude? include,
  }) async {
    return session.db.find<DeviceFields>(
      where: where?.call(DeviceFields.t),
      orderBy: orderBy?.call(DeviceFields.t),
      orderByList: orderByList?.call(DeviceFields.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<DeviceFields?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DeviceFieldsTable>? where,
    int? offset,
    _i1.OrderByBuilder<DeviceFieldsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DeviceFieldsTable>? orderByList,
    _i1.Transaction? transaction,
    DeviceFieldsInclude? include,
  }) async {
    return session.db.findFirstRow<DeviceFields>(
      where: where?.call(DeviceFields.t),
      orderBy: orderBy?.call(DeviceFields.t),
      orderByList: orderByList?.call(DeviceFields.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<DeviceFields?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    DeviceFieldsInclude? include,
  }) async {
    return session.db.findById<DeviceFields>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<DeviceFields>> insert(
    _i1.Session session,
    List<DeviceFields> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<DeviceFields>(
      rows,
      transaction: transaction,
    );
  }

  Future<DeviceFields> insertRow(
    _i1.Session session,
    DeviceFields row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<DeviceFields>(
      row,
      transaction: transaction,
    );
  }

  Future<List<DeviceFields>> update(
    _i1.Session session,
    List<DeviceFields> rows, {
    _i1.ColumnSelections<DeviceFieldsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<DeviceFields>(
      rows,
      columns: columns?.call(DeviceFields.t),
      transaction: transaction,
    );
  }

  Future<DeviceFields> updateRow(
    _i1.Session session,
    DeviceFields row, {
    _i1.ColumnSelections<DeviceFieldsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<DeviceFields>(
      row,
      columns: columns?.call(DeviceFields.t),
      transaction: transaction,
    );
  }

  Future<List<DeviceFields>> delete(
    _i1.Session session,
    List<DeviceFields> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<DeviceFields>(
      rows,
      transaction: transaction,
    );
  }

  Future<DeviceFields> deleteRow(
    _i1.Session session,
    DeviceFields row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<DeviceFields>(
      row,
      transaction: transaction,
    );
  }

  Future<List<DeviceFields>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<DeviceFieldsTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<DeviceFields>(
      where: where(DeviceFields.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DeviceFieldsTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<DeviceFields>(
      where: where?.call(DeviceFields.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class DeviceFieldsAttachRowRepository {
  const DeviceFieldsAttachRowRepository._();

  Future<void> device(
    _i1.Session session,
    DeviceFields deviceFields,
    _i2.Device device, {
    _i1.Transaction? transaction,
  }) async {
    if (deviceFields.id == null) {
      throw ArgumentError.notNull('deviceFields.id');
    }
    if (device.id == null) {
      throw ArgumentError.notNull('device.id');
    }

    var $deviceFields = deviceFields.copyWith(deviceId: device.id);
    await session.db.updateRow<DeviceFields>(
      $deviceFields,
      columns: [DeviceFields.t.deviceId],
      transaction: transaction,
    );
  }
}
