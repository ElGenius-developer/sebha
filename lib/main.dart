import 'package:flutter/material.dart';
import 'package:sebha/sebha_app.dart';

void main() {
  runApp(MaterialApp(
    title: "السبحة",
    locale: const Locale('ar'),
    theme: ThemeData(
      primaryColor: Colors.brown,
      textSelectionTheme: const TextSelectionThemeData(
        selectionColor: Color.fromARGB(255, 208, 183, 107),
        selectionHandleColor: Colors.amber,
      ),
    ),
    home: const SebhaApp(),
    debugShowCheckedModeBanner: false,
  ));
}
