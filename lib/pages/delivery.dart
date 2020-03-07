import 'package:flutter/material.dart';

import 'package:Project_Black_Talon/navigationdrawer.dart';

class DeliveryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delivery'),
      ),
      drawer: NavigationDrawer(),
      body: Center(
        child: Text('Delivery'),
      ),
    );
  }
}
