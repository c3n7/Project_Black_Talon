import 'package:flutter/material.dart';

import 'package:Project_Black_Talon/navigationdrawer.dart';

class GardenArtScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Garden Art'),
      ),
      drawer: NavigationDrawer(),
      body: Center(
        child: Text('Garden Art'),
      ),
    );
  }
}
