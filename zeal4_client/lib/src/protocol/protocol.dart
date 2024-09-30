/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dashboard.dart' as _i2;
import 'device.dart' as _i3;
import 'device_log.dart' as _i4;
import 'example.dart' as _i5;
import 'snapshot_devicelog.dart' as _i6;
import 'user_scope.dart' as _i7;
import 'widget.dart' as _i8;
import 'widget_type.dart' as _i9;
import 'protocol.dart' as _i10;
import 'package:zeal4_client/src/protocol/dashboard.dart' as _i11;
import 'package:zeal4_client/src/protocol/device_log.dart' as _i12;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i13;
export 'dashboard.dart';
export 'device.dart';
export 'device_log.dart';
export 'example.dart';
export 'snapshot_devicelog.dart';
export 'user_scope.dart';
export 'widget.dart';
export 'widget_type.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.Dashboard) {
      return _i2.Dashboard.fromJson(data) as T;
    }
    if (t == _i3.Device) {
      return _i3.Device.fromJson(data) as T;
    }
    if (t == _i4.DeviceLog) {
      return _i4.DeviceLog.fromJson(data) as T;
    }
    if (t == _i5.Example) {
      return _i5.Example.fromJson(data) as T;
    }
    if (t == _i6.SnapshotDeviceLog) {
      return _i6.SnapshotDeviceLog.fromJson(data) as T;
    }
    if (t == _i7.UserScope) {
      return _i7.UserScope.fromJson(data) as T;
    }
    if (t == _i8.DashboardWidget) {
      return _i8.DashboardWidget.fromJson(data) as T;
    }
    if (t == _i9.WidgetType) {
      return _i9.WidgetType.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Dashboard?>()) {
      return (data != null ? _i2.Dashboard.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Device?>()) {
      return (data != null ? _i3.Device.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.DeviceLog?>()) {
      return (data != null ? _i4.DeviceLog.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Example?>()) {
      return (data != null ? _i5.Example.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.SnapshotDeviceLog?>()) {
      return (data != null ? _i6.SnapshotDeviceLog.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.UserScope?>()) {
      return (data != null ? _i7.UserScope.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.DashboardWidget?>()) {
      return (data != null ? _i8.DashboardWidget.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.WidgetType?>()) {
      return (data != null ? _i9.WidgetType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<_i10.DashboardWidget>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i10.DashboardWidget>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i10.DashboardWidget>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i10.DashboardWidget>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i10.DeviceLog>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i10.DeviceLog>(e)).toList()
          : null) as dynamic;
    }
    if (t == List<_i10.DeviceLog>) {
      return (data as List).map((e) => deserialize<_i10.DeviceLog>(e)).toList()
          as dynamic;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList()
          as dynamic;
    }
    if (t == List<_i11.Dashboard>) {
      return (data as List).map((e) => deserialize<_i11.Dashboard>(e)).toList()
          as dynamic;
    }
    if (t == List<_i12.DeviceLog>) {
      return (data as List).map((e) => deserialize<_i12.DeviceLog>(e)).toList()
          as dynamic;
    }
    try {
      return _i13.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.Dashboard) {
      return 'Dashboard';
    }
    if (data is _i3.Device) {
      return 'Device';
    }
    if (data is _i4.DeviceLog) {
      return 'DeviceLog';
    }
    if (data is _i5.Example) {
      return 'Example';
    }
    if (data is _i6.SnapshotDeviceLog) {
      return 'SnapshotDeviceLog';
    }
    if (data is _i7.UserScope) {
      return 'UserScope';
    }
    if (data is _i8.DashboardWidget) {
      return 'DashboardWidget';
    }
    if (data is _i9.WidgetType) {
      return 'WidgetType';
    }
    className = _i13.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'Dashboard') {
      return deserialize<_i2.Dashboard>(data['data']);
    }
    if (data['className'] == 'Device') {
      return deserialize<_i3.Device>(data['data']);
    }
    if (data['className'] == 'DeviceLog') {
      return deserialize<_i4.DeviceLog>(data['data']);
    }
    if (data['className'] == 'Example') {
      return deserialize<_i5.Example>(data['data']);
    }
    if (data['className'] == 'SnapshotDeviceLog') {
      return deserialize<_i6.SnapshotDeviceLog>(data['data']);
    }
    if (data['className'] == 'UserScope') {
      return deserialize<_i7.UserScope>(data['data']);
    }
    if (data['className'] == 'DashboardWidget') {
      return deserialize<_i8.DashboardWidget>(data['data']);
    }
    if (data['className'] == 'WidgetType') {
      return deserialize<_i9.WidgetType>(data['data']);
    }
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i13.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
