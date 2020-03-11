import 'package:flutter/material.dart';

import 'package:Project_Black_Talon/navigationdrawer.dart';

class ContractorsScreen extends StatelessWidget {
  Future<void> _showAlert(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Rewind and remember'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('You will never be satisfied.'),
                Text('You\'re like me. I\'m never satisfied.'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Regret'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

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
