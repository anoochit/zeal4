/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'protocol.dart' as _i2;

abstract class SnapshotDeviceLog implements _i1.SerializableModel {
  SnapshotDeviceLog._({required this.devicelogs});

  factory SnapshotDeviceLog({required List<_i2.DeviceLog> devicelogs}) =
      _SnapshotDeviceLogImpl;

  factory SnapshotDeviceLog.fromJson(Map<String, dynamic> jsonSerialization) {
    return SnapshotDeviceLog(
        devicelogs: (jsonSerialization['devicelogs'] as List)
            .map((e) => _i2.DeviceLog.fromJson((e as Map<String, dynamic>)))
            .toList());
  }

  List<_i2.DeviceLog> devicelogs;

  SnapshotDeviceLog copyWith({List<_i2.DeviceLog>? devicelogs});
  @override
  Map<String, dynamic> toJson() {
    return {'devicelogs': devicelogs.toJson(valueToJson: (v) => v.toJson())};
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _SnapshotDeviceLogImpl extends SnapshotDeviceLog {
  _SnapshotDeviceLogImpl({required List<_i2.DeviceLog> devicelogs})
      : super._(devicelogs: devicelogs);

  @override
  SnapshotDeviceLog copyWith({List<_i2.DeviceLog>? devicelogs}) {
    return SnapshotDeviceLog(
        devicelogs:
            devicelogs ?? this.devicelogs.map((e0) => e0.copyWith()).toList());
  }
}
