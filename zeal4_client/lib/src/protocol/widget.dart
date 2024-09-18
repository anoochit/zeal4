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

abstract class DashboardWidget implements _i1.SerializableModel {
  DashboardWidget._({
    this.id,
    required this.name,
    required this.description,
    int? width,
    int? height,
    int? order,
    required this.deviceId,
    this.device,
    required this.fields,
    required this.units,
    _i2.WidgetType? type,
    required this.labels,
    int? points,
    required this.dashboardId,
    this.dashboard,
    bool? enable,
  })  : width = width ?? 3,
        height = height ?? 1,
        order = order ?? 1,
        type = type ?? _i2.WidgetType.text,
        points = points ?? 60,
        enable = enable ?? false;

  factory DashboardWidget({
    int? id,
    required String name,
    required String description,
    int? width,
    int? height,
    int? order,
    required int deviceId,
    _i2.Device? device,
    required List<String> fields,
    required List<String> units,
    _i2.WidgetType? type,
    required List<String> labels,
    int? points,
    required int dashboardId,
    _i2.Dashboard? dashboard,
    bool? enable,
  }) = _DashboardWidgetImpl;

  factory DashboardWidget.fromJson(Map<String, dynamic> jsonSerialization) {
    return DashboardWidget(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String,
      width: jsonSerialization['width'] as int,
      height: jsonSerialization['height'] as int,
      order: jsonSerialization['order'] as int,
      deviceId: jsonSerialization['deviceId'] as int,
      device: jsonSerialization['device'] == null
          ? null
          : _i2.Device.fromJson(
              (jsonSerialization['device'] as Map<String, dynamic>)),
      fields: (jsonSerialization['fields'] as List)
          .map((e) => e as String)
          .toList(),
      units:
          (jsonSerialization['units'] as List).map((e) => e as String).toList(),
      type: _i2.WidgetType.fromJson((jsonSerialization['type'] as String)),
      labels: (jsonSerialization['labels'] as List)
          .map((e) => e as String)
          .toList(),
      points: jsonSerialization['points'] as int,
      dashboardId: jsonSerialization['dashboardId'] as int,
      dashboard: jsonSerialization['dashboard'] == null
          ? null
          : _i2.Dashboard.fromJson(
              (jsonSerialization['dashboard'] as Map<String, dynamic>)),
      enable: jsonSerialization['enable'] as bool,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  String description;

  int width;

  int height;

  int order;

  int deviceId;

  _i2.Device? device;

  List<String> fields;

  List<String> units;

  _i2.WidgetType type;

  List<String> labels;

  int points;

  int dashboardId;

  _i2.Dashboard? dashboard;

  bool enable;

  DashboardWidget copyWith({
    int? id,
    String? name,
    String? description,
    int? width,
    int? height,
    int? order,
    int? deviceId,
    _i2.Device? device,
    List<String>? fields,
    List<String>? units,
    _i2.WidgetType? type,
    List<String>? labels,
    int? points,
    int? dashboardId,
    _i2.Dashboard? dashboard,
    bool? enable,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'description': description,
      'width': width,
      'height': height,
      'order': order,
      'deviceId': deviceId,
      if (device != null) 'device': device?.toJson(),
      'fields': fields.toJson(),
      'units': units.toJson(),
      'type': type.toJson(),
      'labels': labels.toJson(),
      'points': points,
      'dashboardId': dashboardId,
      if (dashboard != null) 'dashboard': dashboard?.toJson(),
      'enable': enable,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DashboardWidgetImpl extends DashboardWidget {
  _DashboardWidgetImpl({
    int? id,
    required String name,
    required String description,
    int? width,
    int? height,
    int? order,
    required int deviceId,
    _i2.Device? device,
    required List<String> fields,
    required List<String> units,
    _i2.WidgetType? type,
    required List<String> labels,
    int? points,
    required int dashboardId,
    _i2.Dashboard? dashboard,
    bool? enable,
  }) : super._(
          id: id,
          name: name,
          description: description,
          width: width,
          height: height,
          order: order,
          deviceId: deviceId,
          device: device,
          fields: fields,
          units: units,
          type: type,
          labels: labels,
          points: points,
          dashboardId: dashboardId,
          dashboard: dashboard,
          enable: enable,
        );

  @override
  DashboardWidget copyWith({
    Object? id = _Undefined,
    String? name,
    String? description,
    int? width,
    int? height,
    int? order,
    int? deviceId,
    Object? device = _Undefined,
    List<String>? fields,
    List<String>? units,
    _i2.WidgetType? type,
    List<String>? labels,
    int? points,
    int? dashboardId,
    Object? dashboard = _Undefined,
    bool? enable,
  }) {
    return DashboardWidget(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      width: width ?? this.width,
      height: height ?? this.height,
      order: order ?? this.order,
      deviceId: deviceId ?? this.deviceId,
      device: device is _i2.Device? ? device : this.device?.copyWith(),
      fields: fields ?? this.fields.map((e0) => e0).toList(),
      units: units ?? this.units.map((e0) => e0).toList(),
      type: type ?? this.type,
      labels: labels ?? this.labels.map((e0) => e0).toList(),
      points: points ?? this.points,
      dashboardId: dashboardId ?? this.dashboardId,
      dashboard:
          dashboard is _i2.Dashboard? ? dashboard : this.dashboard?.copyWith(),
      enable: enable ?? this.enable,
    );
  }
}
