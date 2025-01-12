import 'package:flutter/material.dart';
import 'package:stroll/utils/ui_utils.dart';
import 'ui/home/home_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyThemes.lightTheme,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
