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
import 'dashboard_widget.dart' as _i3;
import 'device.dart' as _i4;
import 'device_field.dart' as _i5;
import 'device_log.dart' as _i6;
import 'example.dart' as _i7;
import 'field_type.dart' as _i8;
import 'widget_type.dart' as _i9;
import 'protocol.dart' as _i10;
export 'dashboard.dart';
export 'dashboard_widget.dart';
export 'device.dart';
export 'device_field.dart';
export 'device_log.dart';
export 'example.dart';
export 'field_type.dart';
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
    if (t == _i3.DashboardWidget) {
      return _i3.DashboardWidget.fromJson(data) as T;
    }
    if (t == _i4.Device) {
      return _i4.Device.fromJson(data) as T;
    }
    if (t == _i5.DeviceFields) {
      return _i5.DeviceFields.fromJson(data) as T;
    }
    if (t == _i6.DeviceLog) {
      return _i6.DeviceLog.fromJson(data) as T;
    }
    if (t == _i7.Example) {
      return _i7.Example.fromJson(data) as T;
    }
    if (t == _i8.FieldType) {
      return _i8.FieldType.fromJson(data) as T;
    }
    if (t == _i9.WidgetType) {
      return _i9.WidgetType.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Dashboard?>()) {
      return (data != null ? _i2.Dashboard.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.DashboardWidget?>()) {
      return (data != null ? _i3.DashboardWidget.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.Device?>()) {
      return (data != null ? _i4.Device.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.DeviceFields?>()) {
      return (data != null ? _i5.DeviceFields.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.DeviceLog?>()) {
      return (data != null ? _i6.DeviceLog.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Example?>()) {
      return (data != null ? _i7.Example.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.FieldType?>()) {
      return (data != null ? _i8.FieldType.fromJson(data) : null) as T;
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
    if (t == _i1.getType<List<_i10.DeviceFields>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i10.DeviceFields>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i10.DeviceLog>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i10.DeviceLog>(e)).toList()
          : null) as dynamic;
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
    if (data is _i3.DashboardWidget) {
      return 'DashboardWidget';
    }
    if (data is _i4.Device) {
      return 'Device';
    }
    if (data is _i5.DeviceFields) {
      return 'DeviceFields';
    }
    if (data is _i6.DeviceLog) {
      return 'DeviceLog';
    }
    if (data is _i7.Example) {
      return 'Example';
    }
    if (data is _i8.FieldType) {
      return 'FieldType';
    }
    if (data is _i9.WidgetType) {
      return 'WidgetType';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'Dashboard') {
      return deserialize<_i2.Dashboard>(data['data']);
    }
    if (data['className'] == 'DashboardWidget') {
      return deserialize<_i3.DashboardWidget>(data['data']);
    }
    if (data['className'] == 'Device') {
      return deserialize<_i4.Device>(data['data']);
    }
    if (data['className'] == 'DeviceFields') {
      return deserialize<_i5.DeviceFields>(data['data']);
    }
    if (data['className'] == 'DeviceLog') {
      return deserialize<_i6.DeviceLog>(data['data']);
    }
    if (data['className'] == 'Example') {
      return deserialize<_i7.Example>(data['data']);
    }
    if (data['className'] == 'FieldType') {
      return deserialize<_i8.FieldType>(data['data']);
    }
    if (data['className'] == 'WidgetType') {
      return deserialize<_i9.WidgetType>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
