// ignore_for_file: file_names

import 'package:flutter/material.dart';

class OurTheme {
  Color lightOrange = const Color.fromARGB(255, 253, 124, 40);
  Color lighterGrey = const Color.fromARGB(255, 164, 164, 164);
  Color darkerGrey = const Color.fromARGB(255, 119, 124, 135);

  ThemeData buildTheme() {
    return ThemeData(
      canvasColor: lightOrange,
      primaryColor: lightOrange,
      secondaryHeaderColor: darkerGrey,
      primaryColorLight: lighterGrey,
      hintColor: lighterGrey,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: lighterGrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: lightOrange),
        ),
      ),
    );
  }
}
