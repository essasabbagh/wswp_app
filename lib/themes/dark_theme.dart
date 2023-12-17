import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    // seedColor: Colors.deepPurple,// 074b28
    seedColor: const Color(0xFF074B28),
  ),
  useMaterial3: true,
);
