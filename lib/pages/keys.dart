import 'package:flutter/material.dart';

import 'package:Project_Black_Talon/navigationdrawer.dart';

class KeysScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Keys'),
      ),
      drawer: NavigationDrawer(),
      body: Center(
        child: Text('Keys'),
      ),
    );
  }
}
