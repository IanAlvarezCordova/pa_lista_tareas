import 'package:flutter/material.dart';
// ignore: unused_import
import 'controller/tarea_controller.dart';
import 'view/home_page.dart';
import 'themes/app_themes.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: HomePage(),
    );
  }
}