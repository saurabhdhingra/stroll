import 'package:flutter/material.dart';

// I like to dynamically udate the UI of the app using these functions.
// I haven't really used them in this assignment but I have given an example
// in the home_ui by using them for the gap betweent the title and the rest of the
// of the content.
class SizeConfig {
  static getHeight(context) {
    return MediaQuery.of(context).size.height;
  }

  static getWidth(context) {
    return MediaQuery.of(context).size.width;
  }
}

// Although I am not using themes here but when I do, this is how I declare them
// in a file named ui_utils inside the utils folder. I prefer theme management 
// using a global provider.

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    primaryColor: const Color(0xFF1D1C1E), // Darker background color
    colorScheme: const ColorScheme.dark().copyWith(
      primary: Colors.black,
      secondary: Colors.white,
    ),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFF3F2F7), // Light background color
    primaryColor: Colors.white,
    colorScheme: const ColorScheme.light().copyWith(
      primary: Colors.white,
      secondary: Colors.black,
    ),
  );
}
