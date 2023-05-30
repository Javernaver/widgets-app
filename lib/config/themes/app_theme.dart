import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.red,
  Colors.green,
  Colors.purple,
  Colors.orange,
  Colors.teal,
  Colors.pink,
  Colors.amber,
  Colors.brown,
  Colors.cyan,
  Colors.deepOrange,
  Colors.deepPurple,
  Colors.indigo,
  Colors.lime,
  Colors.yellow,
  Colors.lightBlue,
  Colors.lightGreen,
  Colors.grey,
  Colors.blueGrey,
  Colors.black,
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({
    this.selectedColor = 0,
    this.isDarkMode = false,
  }) : assert(selectedColor >= 0 && selectedColor < colorList.length);

  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      colorSchemeSeed: colorList[selectedColor],
      appBarTheme: const AppBarTheme(
        centerTitle: false,
      ));
}
