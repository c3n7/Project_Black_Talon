import 'package:flutter/material.dart';
import 'package:Project_Black_Talon/login.dart';
import 'package:Project_Black_Talon/home.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Black Talon',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Color(0xFF5B2326),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
      },
    ),
  );
}
