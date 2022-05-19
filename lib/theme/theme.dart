import 'package:flutter/material.dart';

class MyThemes {
  static ThemeData lightTheme = ThemeData(
      iconTheme: const IconThemeData(color: Colors.white),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: Colors.grey.shade500,
      ));

  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: Colors.grey,
      brightness: Brightness.dark,
    ),
  );
}

class MyColors {
  static Color creamColor = const Color(0xfff5f5f5);
  static Color darkCreamColor = const Color.fromARGB(255, 20, 20, 36);
  static Color darkBluishColor = const Color(0xff403b58);
  static Color lightBluishColor = Colors.indigo.shade400;
}
