import 'package:flutter/material.dart';

import 'package:Project_Black_Talon/navigationdrawer.dart';

class VisitorsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visitors'),
      ),
      drawer: NavigationDrawer(),
      body: Center(
        child: Text('Visitors'),
      ),
    );
  }
}
