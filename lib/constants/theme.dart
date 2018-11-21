import 'package:flutter/material.dart';

class KaffeTheme {
  static get classicTheme {
    return ThemeData.light().copyWith(
      primaryColor: Colors.white,
      accentColor: Colors.black87,
      buttonColor: Colors.black,
      textSelectionColor: Colors.black87,
      backgroundColor: Colors.white,
      toggleableActiveColor: Colors.black87,
    );
  }

  static get modernTheme {
    return ThemeData.light().copyWith(
      primaryColor: Colors.white,
      accentColor: Color(0xFFFBAE17),
      buttonColor: Color(0xFFFA9D11),
      textSelectionColor: Color(0xFFFDD78B),
      backgroundColor: Colors.white,
      toggleableActiveColor: Color(0xFFFBAE17),
      primaryColorLight: Color(0xFFFEE7B9),
    );
  }
}