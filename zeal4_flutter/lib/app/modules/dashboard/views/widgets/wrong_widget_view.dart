import 'package:flutter/material.dart';

import 'package:get/get.dart';

class WrongWidgetView extends GetView {
  const WrongWidgetView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Center(
        child: Text(
          'No Widget Define',
        ),
      ),
    );
  }
}
