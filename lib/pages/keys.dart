import 'package:flutter/material.dart';

import 'package:Project_Black_Talon/navigationdrawer.dart';

enum KeyStatus { OKAY, LOST }

class KeysScreen extends StatefulWidget {
  @override
  _KeysScreenState createState() => _KeysScreenState();
}

class _KeysScreenState extends State<KeysScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController =
      new TextEditingController();
  final TextEditingController _lastNameController = new TextEditingController();
  final TextEditingController _phoneNbrController = new TextEditingController();
  final TextEditingController _keyDepartmentController =
      new TextEditingController();
  final TextEditingController _whoReturnedController =
      new TextEditingController();
  final TextEditingController _keyStatusController =
      new TextEditingController();
  final TextEditingController _securityPersonController =
      new TextEditingController();

  Widget _buildFirstNameInputWidget() {
    return new Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: new TextFormField(
        controller: _firstNameController,
        validator: _firstNameValidator,
        decoration: InputDecoration(
          labelText: 'First Name',
        ),
      ),
    );
  }

  String _firstNameValidator(String fname) {
    return fname.isEmpty ? 'This field can\'t be left blank' : null;
  }

  Widget _buildLastNameInputWidget() {
    return new Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: new TextFormField(
        controller: _lastNameController,
        validator: _lastNameValidator,
        decoration: InputDecoration(
          labelText: 'Last Name',
        ),
      ),
    );
  }

  String _lastNameValidator(String lname) {
    return lname.isEmpty ? 'This field can\'t be left blank' : null;
  }

  Widget _buildPhoneNbrInputWidget() {
    return new Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: new TextFormField(
        controller: _phoneNbrController,
        validator: _phoneNbrValidator,
        decoration: InputDecoration(
          labelText: 'Phone Number',
        ),
      ),
    );
  }

  String _phoneNbrValidator(String phone) {
    return phone.isEmpty ? 'This field can\'t be left blank' : null;
  }

  Widget _buildKeyDepartmentInputWidget() {
    return new Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: new TextFormField(
        controller: _keyDepartmentController,
        validator: _keyDepartmentValidator,
        decoration: InputDecoration(
          labelText: 'Key Department',
        ),
      ),
    );
  }

  String _keyDepartmentValidator(String keyDept) {
    return keyDept.isEmpty ? 'This field can\'t be left blank' : null;
  }

  Widget _buildWhoReturnedInputWidget() {
    return new Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: new TextFormField(
        controller: _whoReturnedController,
        validator: _whoReturnedValidator,
        decoration: InputDecoration(
          labelText: 'Who Returned',
        ),
      ),
    );
  }

  String _whoReturnedValidator(String whoReturned) {
    return whoReturned.isEmpty ? 'This field can\'t be left blank' : null;
  }

  KeyStatus _keyStatus = KeyStatus.OKAY;

  Widget _buildKeyStatusInputWidget() {
    return new Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[
          FlatButton.icon(
            label: const Text('Okay'),
            icon: Radio(
              value: KeyStatus.OKAY,
              groupValue: _keyStatus,
              onChanged: (KeyStatus value) {
                setState(() {
                  _keyStatus = value;
                });
              },
            ),
            onPressed: () {
              setState(() {
                _keyStatus = KeyStatus.OKAY;
              });
            },
          ),
          FlatButton.icon(
            label: const Text('Lost'),
            icon: Radio(
              value: KeyStatus.LOST,
              groupValue: _keyStatus,
              onChanged: (KeyStatus value) {
                setState(() {
                  _keyStatus = value;
                });
              },
            ),
            onPressed: () {
              setState(() {
                _keyStatus = KeyStatus.LOST;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSecurityPersonInputWidget() {
    return new Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: new TextFormField(
        controller: _securityPersonController,
        validator: _securityPersonValidator,
        decoration: InputDecoration(
          labelText: 'Security Person',
        ),
      ),
    );
  }

  String _securityPersonValidator(String securityPerson) {
    return securityPerson.isEmpty ? 'This field can\'t be left blank' : null;
  }

  void _submitButtonPressed() {
    if (_formKey.currentState.validate()) {
      String _firstName = _firstNameController.text;
      String _lastName = _lastNameController.text;
      String _phoneNbr = _phoneNbrController.text;
      String _keyDepartment = _keyDepartmentController.text;
      String _securityPerson = _securityPersonController.text;
      String _whoReturned = _whoReturnedController.text;
      String _keyStatusString = _keyStatus == KeyStatus.OKAY ? 'Okay' : 'Lost';
      print(_firstName +
          " : " +
          _lastName +
          " : " +
          _phoneNbr +
          ' : ' +
          _keyDepartment +
          ' : ' +
          _securityPerson +
          ' : ' +
          _whoReturned +
          ' : ' +
          _keyStatusString);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Keys'),
      ),
      drawer: NavigationDrawer(),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            _buildFirstNameInputWidget(),
            _buildLastNameInputWidget(),
            _buildPhoneNbrInputWidget(),
            _buildKeyDepartmentInputWidget(),
            _buildWhoReturnedInputWidget(),
            Container(
              margin: EdgeInsets.only(left: 8.0, right: 8.0, top: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    'Key Status',
                    style: TextStyle(
                      fontSize: 17.5,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            _buildKeyStatusInputWidget(),
            _buildSecurityPersonInputWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                onPressed: _submitButtonPressed,
                child: Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
