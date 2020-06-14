import 'package:flutter/material.dart';

import 'package:Project_Black_Talon/navigationdrawer.dart';

class WhiteAsSnowScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('White as Snow'),
      ),
      drawer: NavigationDrawer(),
      body: Center(
        child: Text('White as Snow'),
      ),
    );
  }
}
