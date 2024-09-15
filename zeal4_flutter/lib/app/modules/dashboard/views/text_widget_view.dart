import 'package:flutter/material.dart';

import 'package:get/get.dart';

class TextWidgetView extends GetView {
  const TextWidgetView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TextWidgetView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TextWidgetView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
