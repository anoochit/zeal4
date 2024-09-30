import 'dart:io';

import 'package:flutter/material.dart';

import 'package:bitsdojo_window/bitsdojo_window.dart';

initWindows() {
  // check desktop platform to config windows size
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    doWhenWindowReady(() {
      final win = appWindow;
      const initialSize = Size(1280, 720);
      const minSize = Size(560, 720);
      win.minSize = minSize;
      win.size = initialSize;
      win.alignment = Alignment.center;
      // win.show();
      win.maximize();
    });
  }
}
