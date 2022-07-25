import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sebha/sebha_app.dart';

void main() {
  runApp(MaterialApp(
    builder: (context, child) => DevicePreview.appBuilder(context, child),
    title: "السبحة",
    theme: ThemeData(
      primaryColor: Colors.brown,
    ),
    home: DevicePreview(
      builder: (context) => SebhaApp(),
      enabled: kDebugMode,
    ),
    debugShowCheckedModeBanner: false,
  ));
}
