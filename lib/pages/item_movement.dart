import 'package:flutter/material.dart';

import 'package:Project_Black_Talon/navigationdrawer.dart';

class ItemMovementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item Movement'),
      ),
      drawer: NavigationDrawer(),
      body: Center(
        child: Text('Item Movement'),
      ),
    );
  }
}
