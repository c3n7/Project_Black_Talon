import 'package:flutter/material.dart';

import 'package:Project_Black_Talon/login.dart';
import 'package:Project_Black_Talon/home.dart';
import 'package:Project_Black_Talon/pages/contractors.dart';
import 'package:Project_Black_Talon/pages/delivery.dart';
import 'package:Project_Black_Talon/pages/domestic_and_teachers.dart';
import 'package:Project_Black_Talon/pages/garden_art.dart';
import 'package:Project_Black_Talon/pages/item_movement.dart';
import 'package:Project_Black_Talon/pages/keys.dart';
import 'package:Project_Black_Talon/pages/receiving_parcels.dart';
import 'package:Project_Black_Talon/pages/sports.dart';
import 'package:Project_Black_Talon/pages/students.dart';
import 'package:Project_Black_Talon/pages/visitors.dart';
import 'package:Project_Black_Talon/pages/white_as_snow.dart';
import 'package:Project_Black_Talon/pages/scan_to_check_in.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Black Talon',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Color(0xFF772E25),
        dialogBackgroundColor: Color(0xFFEDDDD4),
        backgroundColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/contractors': (context) => ContractorsScreen(),
        '/delivery': (context) => DeliveryScreen(),
        '/domestic_and_teachers': (context) => DomesticAndTeachersScreen(),
        '/garden_art': (context) => GardenArtScreen(),
        '/item_movement': (context) => ItemMovementScreen(),
        '/keys': (context) => KeysScreen(),
        '/receiving_parcels': (context) => ReceivingParcelsScreen(),
        '/scan_to_check_in': (context) => ScanToCheckInScreen(),
        '/sports': (context) => SportsScreen(),
        '/students': (context) => StudentsScreen(),
        '/visitors': (context) => VisitorsScreen(),
        '/white_as_snow': (context) => WhiteAsSnowScreen(),
      },
    ),
  );
}
