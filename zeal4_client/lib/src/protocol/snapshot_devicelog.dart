/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'device_log.dart' as _i2;
import 'package:zeal4_client/src/protocol/protocol.dart' as _i3;
import 'package:meta/meta.dart' as _i4;

abstract class SnapshotDeviceLog implements _i1.SerializableModel {
  SnapshotDeviceLog._({required this.devicelogs});

  factory SnapshotDeviceLog({required List<_i2.DeviceLog> devicelogs}) =
      _SnapshotDeviceLogImpl;

  factory SnapshotDeviceLog.fromJson(Map<String, dynamic> jsonSerialization) {
    return SnapshotDeviceLog(
      devicelogs: _i3.Protocol().deserialize<List<_i2.DeviceLog>>(
        jsonSerialization['devicelogs'],
      ),
    );
  }

  List<_i2.DeviceLog> devicelogs;

  /// Returns a shallow copy of this [SnapshotDeviceLog]
  /// with some or all fields replaced by the given arguments.
  @_i4.useResult
  SnapshotDeviceLog copyWith({List<_i2.DeviceLog>? devicelogs});
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'SnapshotDeviceLog',
      'devicelogs': devicelogs.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _SnapshotDeviceLogImpl extends SnapshotDeviceLog {
  _SnapshotDeviceLogImpl({required List<_i2.DeviceLog> devicelogs})
    : super._(devicelogs: devicelogs);

  /// Returns a shallow copy of this [SnapshotDeviceLog]
  /// with some or all fields replaced by the given arguments.
  @_i4.useResult
  @override
  SnapshotDeviceLog copyWith({List<_i2.DeviceLog>? devicelogs}) {
    return SnapshotDeviceLog(
      devicelogs:
          devicelogs ?? this.devicelogs.map((e0) => e0.copyWith()).toList(),
    );
  }
}
