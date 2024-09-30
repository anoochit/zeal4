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

enum WidgetType implements _i1.SerializableModel {
  text,
  stext,
  bar,
  sbar,
  line,
  sline,
  spline,
  sspline,
  pie,
  spie,
  table,
  stable,
  map,
  smap;

  static WidgetType fromJson(String name) {
    switch (name) {
      case 'text':
        return text;
      case 'stext':
        return stext;
      case 'bar':
        return bar;
      case 'sbar':
        return sbar;
      case 'line':
        return line;
      case 'sline':
        return sline;
      case 'spline':
        return spline;
      case 'sspline':
        return sspline;
      case 'pie':
        return pie;
      case 'spie':
        return spie;
      case 'table':
        return table;
      case 'stable':
        return stable;
      case 'map':
        return map;
      case 'smap':
        return smap;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "WidgetType"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
