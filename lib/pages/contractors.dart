import 'package:flutter/material.dart';

import 'package:Project_Black_Talon/navigationdrawer.dart';

class ContractorsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contractors'),
      ),
      drawer: NavigationDrawer(),
      body: Center(
        child: Text('Contractors'),
      ),
    );
  }
}
