import 'package:flutter/material.dart';

class KaffeTheme {
  static get classicTheme {
    return ThemeData.light().copyWith(
      primaryColor: Colors.black,
      primaryColorLight: Colors.black87,
      accentColor: Colors.black54,
      splashColor: Colors.black26,
      buttonColor: Colors.black,
      textSelectionColor: Colors.black87,
      backgroundColor: Colors.white,
      toggleableActiveColor: Colors.black87,
      bottomAppBarColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
  chipTheme: ChipThemeData.fromDefaults(
    primaryColor: Colors.black,
    labelStyle: TextStyle(fontFamily: 'Raleway', fontSize: 12, color: Colors.white),
    secondaryColor: Colors.black,
  )
    );
  }

  static get modernTheme {
    return ThemeData.light().copyWith(
      primaryColor: Color(0xFFFBAE17),
      accentColor: Colors.white,
      buttonColor: Color(0xFFFA9D11),
      textSelectionColor: Color(0xFFFDD78B),
      backgroundColor: Colors.white,
      toggleableActiveColor: Color(0xFFFBAE17),
      primaryColorLight: Color(0xFFFBAE17),
      errorColor: Color(0xFFFB7C17),
    );
  }
}