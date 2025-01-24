import 'package:flutter/material.dart';

class MyTheme{
  static final darkTheme=ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.black,
    colorScheme:const ColorScheme.dark(),
      brightness: Brightness.dark

  );
  static final lightTheme=ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
    colorScheme:const ColorScheme.light(),
    brightness: Brightness.light

  );

}