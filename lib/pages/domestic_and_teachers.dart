import 'package:flutter/material.dart';

import 'package:Project_Black_Talon/navigationdrawer.dart';

class DomesticAndTeachersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Domestic and Teachers'),
      ),
      drawer: NavigationDrawer(),
      body: Center(
        child: Text('Domestic and Teachers'),
      ),
    );
  }
}
