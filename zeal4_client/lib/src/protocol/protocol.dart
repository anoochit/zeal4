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
import 'device.dart' as _i2;
import 'device_log.dart' as _i3;
import 'example.dart' as _i4;
import 'protocol.dart' as _i5;
export 'device.dart';
export 'device_log.dart';
export 'example.dart';
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
    if (t == _i2.Device) {
      return _i2.Device.fromJson(data) as T;
    }
    if (t == _i3.DeviceLog) {
      return _i3.DeviceLog.fromJson(data) as T;
    }
    if (t == _i4.Example) {
      return _i4.Example.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Device?>()) {
      return (data != null ? _i2.Device.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.DeviceLog?>()) {
      return (data != null ? _i3.DeviceLog.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.Example?>()) {
      return (data != null ? _i4.Example.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<_i5.DeviceLog>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i5.DeviceLog>(e)).toList()
          : null) as dynamic;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.Device) {
      return 'Device';
    }
    if (data is _i3.DeviceLog) {
      return 'DeviceLog';
    }
    if (data is _i4.Example) {
      return 'Example';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'Device') {
      return deserialize<_i2.Device>(data['data']);
    }
    if (data['className'] == 'DeviceLog') {
      return deserialize<_i3.DeviceLog>(data['data']);
    }
    if (data['className'] == 'Example') {
      return deserialize<_i4.Example>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
