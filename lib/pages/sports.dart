import 'package:flutter/material.dart';

import 'package:Project_Black_Talon/navigationdrawer.dart';

class SportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sports'),
      ),
      drawer: NavigationDrawer(),
      body: Center(
        child: Text('Sports'),
      ),
    );
  }
}
