import 'package:flutter/material.dart';

import 'package:Project_Black_Talon/navigationdrawer.dart';

class ReceivingParcelsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Receiving Parcels'),
      ),
      drawer: NavigationDrawer(),
      body: Center(
        child: Text('Receiving Parcels'),
      ),
    );
  }
}
