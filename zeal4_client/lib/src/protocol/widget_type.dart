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
  pie,
  table,
  map;

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
      case 'pie':
        return pie;
      case 'table':
        return table;
      case 'map':
        return map;
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
