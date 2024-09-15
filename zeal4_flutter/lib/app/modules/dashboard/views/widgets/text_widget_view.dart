import 'package:flutter/material.dart';

import 'package:get/get.dart';

class TextWidgetView extends GetView {
  const TextWidgetView({super.key});
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
