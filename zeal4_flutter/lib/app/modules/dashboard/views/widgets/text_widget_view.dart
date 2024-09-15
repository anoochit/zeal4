import 'package:flutter/material.dart';

import 'package:get/get.dart';

class TextWidgetView extends GetView {
  const TextWidgetView({
    super.key,
    required this.name,
    required this.description,
    required this.fields,
    required this.deviceId,
  });

  final String name;
  final String description;
  final List<String> fields;
  final int deviceId;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      child: Center(
        child: Text(
          'TextWidgetView is working',
        ),
      ),
    );
  }
}
