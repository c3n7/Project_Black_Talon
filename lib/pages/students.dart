import 'package:flutter/material.dart';

import 'package:Project_Black_Talon/navigationdrawer.dart';

class StudentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Students'),
      ),
      drawer: NavigationDrawer(),
      body: Center(
        child: Text('Students'),
      ),
    );
  }
}
