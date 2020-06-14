import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';

import 'package:Project_Black_Talon/navigationdrawer.dart';

class ScanToCheckInScreen extends StatefulWidget {
  @override
  _ScanToCheckInState createState() => new _ScanToCheckInState();
}

class _ScanToCheckInState extends State<ScanToCheckInScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String barcode = "";
  @override
  void initState() {
    super.initState();
  }

  _showConfirmationDialog() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Theme.of(context).backgroundColor,
          height: 178,
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(0, 12, 0, 7),
                child: Text(
                  "Confirm",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF011638),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: Theme.of(context).dialogBackgroundColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 6),
                              child: Icon(
                                Icons.person,
                                size: 16.0,
                                color: Color(0xFF011638),
                              ),
                            ),
                            Text(
                              'John Doe',
                              style: TextStyle(
                                // color: Color(0xFF56A3A6),
                                color: Color(0xFF011638),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 6),
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 6),
                                child: Icon(
                                  Icons.email,
                                  size: 16.0,
                                  color: Color(0xFF011638),
                                ),
                              ),
                              Text(
                                this.barcode,
                                style: TextStyle(
                                  color: Color(0xFF011638),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: ButtonBar(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    MaterialButton(
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Theme.of(context).primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    MaterialButton(
                      child: Text('Check-In'),
                      color: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildScanPage() {
    return new Center(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Image(
              image: AssetImage('assets/user-qrcode.png'),
              height: 250,
            ),
          ),
          Container(
            child: Text(
              'Scan the QR Code to check in or out',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(70, 0, 70, 10),
            child: Text(
              'Make sure you have granted this app permission to access the camera',
              style: TextStyle(
                // fontSize: 20,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          RaisedButton(
            color: Theme.of(context).primaryColor,
            textColor: Colors.white,
            onPressed: scan,
            child: Text('Scan'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Scan'),
      ),
      drawer: NavigationDrawer(),
      body: _buildScanPage(),
    );
  }

  Future scan() async {
    ScanResult barcode = await BarcodeScanner.scan();
    setState(() {
      this.barcode = barcode.rawContent.toString();
      print(this.barcode);
    });
    _showConfirmationDialog();
  }
}
