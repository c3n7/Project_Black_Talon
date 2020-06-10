import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';

import 'package:Project_Black_Talon/navigationdrawer.dart';

class WhiteAsSnowScreen extends StatefulWidget {
  @override
  _WhiteAsSnowState createState() => new _WhiteAsSnowState();
}

class _WhiteAsSnowState extends State<WhiteAsSnowScreen> {
  String barcode = "";
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('White as Snow'),
      ),
      drawer: NavigationDrawer(),
      body: Center(
        // child: Text('White as Snow'),
        child: RaisedButton(
          color: Theme.of(context).primaryColor,
          textColor: Colors.white,
          onPressed: scan,
          child: this.barcode != "" ? Text(this.barcode) : Text('Scan Text'),
        ),
      ),
    );
  }

  Future scan() async {
    ScanResult barcode = await BarcodeScanner.scan();
    setState(() {
      this.barcode = barcode.rawContent.toString();
      print(this.barcode);
    });
  }
}
