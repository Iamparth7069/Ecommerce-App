import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      elevatedButtonTheme: elevatedButtonTheme(),
    // outlinedButtonTheme: themetotextfild(),
    inputDecorationTheme: inputdecorationtheme(),
      appBarTheme: appBarTheme()
  );
}
appBarTheme() {
  return AppBarTheme(
      elevation: 0,
      color: Colors.white,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black));
}

inputdecorationtheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: BorderSide(color: Colors.black45),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
    border: outlineInputBorder
  );
}



elevatedButtonTheme() {
  return ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 30)),
        backgroundColor: MaterialStateProperty.all(Colors.pink),
        foregroundColor: MaterialStateProperty.all(Colors.white),
      )
  );
}
