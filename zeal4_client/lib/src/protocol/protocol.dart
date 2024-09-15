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
import 'widget.dart' as _i6;
import 'widget_type.dart' as _i7;
import 'protocol.dart' as _i8;
import 'package:zeal4_client/src/protocol/dashboard.dart' as _i9;
export 'dashboard.dart';
export 'device.dart';
export 'device_log.dart';
export 'example.dart';
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
    if (t == _i6.DashboardWidget) {
      return _i6.DashboardWidget.fromJson(data) as T;
    }
    if (t == _i7.WidgetType) {
      return _i7.WidgetType.fromJson(data) as T;
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
    if (t == _i1.getType<_i6.DashboardWidget?>()) {
      return (data != null ? _i6.DashboardWidget.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.WidgetType?>()) {
      return (data != null ? _i7.WidgetType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<_i8.DashboardWidget>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i8.DashboardWidget>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i8.DashboardWidget>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i8.DashboardWidget>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i8.DeviceLog>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i8.DeviceLog>(e)).toList()
          : null) as dynamic;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList()
          as dynamic;
    }
    if (t == List<_i9.Dashboard>) {
      return (data as List).map((e) => deserialize<_i9.Dashboard>(e)).toList()
          as dynamic;
    }
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
    if (data is _i6.DashboardWidget) {
      return 'DashboardWidget';
    }
    if (data is _i7.WidgetType) {
      return 'WidgetType';
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
    if (data['className'] == 'DashboardWidget') {
      return deserialize<_i6.DashboardWidget>(data['data']);
    }
    if (data['className'] == 'WidgetType') {
      return deserialize<_i7.WidgetType>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
