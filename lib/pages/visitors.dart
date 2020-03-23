import 'package:flutter/material.dart';
import 'package:Project_Black_Talon/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:Project_Black_Talon/navigationdrawer.dart';

class VisitorsScreen extends StatefulWidget {
  _VisitorsScreen createState() => _VisitorsScreen();
}

class _VisitorsScreen extends State<StatefulWidget> {
  final _idFormKey = GlobalKey<FormState>();
  final _bioFormKey = GlobalKey<FormState>();
  final _visitDetailsFormKey = GlobalKey<FormState>();
  final TextEditingController _idNumberInputController =
      new TextEditingController();
  final TextEditingController _firstNameInputController =
      new TextEditingController();
  final TextEditingController _surnameInputController =
      new TextEditingController();
  final TextEditingController _phoneNbrInputController =
      new TextEditingController();
  final TextEditingController _vehicleRegInputController =
      new TextEditingController();
  final TextEditingController _purposeInputController =
      new TextEditingController();
  final TextEditingController _hostInputController =
      new TextEditingController();

  int _currentStep = 0;
  bool _accountPresent = false;

  CrudMethods obj = new CrudMethods();

  // TODO(c3n7): Do better validation
  String _idNumberValidator(String idNumber) {
    if (idNumber.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  String _firstNameValidator(String firstName) {
    if (firstName.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  String _surnameValidator(String surname) {
    if (surname.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  String _phoneNbrValidator(String phoneNbr) {
    if (phoneNbr.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  String _vehicleRegValidator(String vehicleReg) {
    // TODO(c3n7): Improve this validator
    if (vehicleReg.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  String _purposeValidator(String purpose) {
    if (purpose.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  String _hostValidator(String host) {
    if (host.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  List<StepState> _stepStates = [
    StepState.editing,
    StepState.indexed,
    StepState.indexed,
  ];

  List<Step> _getSteps() {
    List<Step> _steps = [
      Step(
        title: const Text('Id Number'),
        isActive: _currentStep >= 0,
        state: _stepStates[0],
        content: Form(
          key: _idFormKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _idNumberInputController,
                validator: _idNumberValidator,
                decoration: InputDecoration(labelText: 'Id number'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
        ),
      ),
      Step(
        title: const Text('Your Details'),
        isActive: _currentStep >= 1,
        state: _stepStates[1],
        content: _buildYourDetails(),
      ),
      Step(
        title: const Text('Visit Details'),
        isActive: _currentStep >= 1,
        state: _stepStates[1],
        content: _buildVisitDetails(),
      ),
    ];
    return _steps;
  }

  Widget _buildYourDetails() {
    if (!_accountPresent) {
      return new Form(
        key: _bioFormKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _firstNameInputController,
              validator: _firstNameValidator,
              decoration: InputDecoration(labelText: 'First Name'),
            ),
            TextFormField(
              controller: _surnameInputController,
              validator: _surnameValidator,
              decoration: InputDecoration(labelText: 'Surname'),
            ),
            TextFormField(
              controller: _phoneNbrInputController,
              validator: _phoneNbrValidator,
              decoration: InputDecoration(labelText: 'Phone Number'),
              keyboardType: TextInputType.number,
            ),
            // TODO(c3n7): Handle this car issue differently
            // In a standalone step, possibly
            TextFormField(
              controller: _vehicleRegInputController,
              validator: _vehicleRegValidator,
              decoration:
                  InputDecoration(labelText: 'Vehicle Registration Number'),
            ),
          ],
        ),
      );
    } else {
      return new Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 2.5),
            child: Row(
              children: <Widget>[
                Text(
                  "First Name: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "John",
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 2.5),
            child: Row(
              children: <Widget>[
                Text(
                  "Surname: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Doe",
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 2.5),
            child: Row(
              children: <Widget>[
                Text(
                  "Phone Number: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "+2547 123 445",
                ),
              ],
            ),
          ),
          TextFormField(
            controller: _vehicleRegInputController,
            validator: _vehicleRegValidator,
            decoration:
                InputDecoration(labelText: 'Vehicle Registration Number'),
          ),
        ],
      );
    }
  }

  Widget _buildVisitDetails() {
    return new Form(
      key: _visitDetailsFormKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: _hostInputController,
            validator: _hostValidator,
            decoration: InputDecoration(labelText: 'Host'),
          ),
          TextFormField(
            controller: _purposeInputController,
            validator: _purposeValidator,
            decoration: InputDecoration(labelText: 'Purpose'),
            maxLines: null,
            keyboardType: TextInputType.multiline,
          ),
        ],
      ),
    );
  }

  Future<void> getVisitor() async {
    return await Firestore.instance
        .collection('visitors')
        .where('Id_Number', isEqualTo: this._idNumberInputController.text)
        .getDocuments();
  }

  Future<void> checkExists(reference, idNumber) async {
    DocumentSnapshot doc =
        await reference.collection('visitors').document(idNumber).get();
    this.setState(() {
      _accountPresent = doc.exists;
    });
  }

  _continue() {
    setState(() {
      if (this._currentStep == 0) {
        // The ID Number entry form
        if (_idFormKey.currentState.validate()) {
          print("Id Number : " + _idNumberInputController.text);

          _stepStates[this._currentStep] = StepState.indexed;
          this._currentStep += 1;
          _stepStates[this._currentStep] = StepState.editing;
          checkExists(_accountPresent, _idNumberInputController.text);
          // TODO(ruth): Check if the ID is in firebase then modify:
          _accountPresent = false;
        }
      } else if (this._currentStep == 1) {
        // The second step
        if (_accountPresent) {
          getVisitor();
          // TODO(ruth): The account for the bio exists, react appropriately
          _stepStates[this._currentStep] = StepState.indexed;
          this._currentStep += 1;
          _stepStates[this._currentStep] = StepState.editing;
        } else {
          if (_bioFormKey.currentState.validate()) {
            _stepStates[this._currentStep] = StepState.indexed;
            this._currentStep += 1;
            _stepStates[this._currentStep] = StepState.editing;
            // TODO(ruth): The account for the bio doesn't exist, react appropriately
            obj.addVisitor({
              'First_Name': this._firstNameInputController.text,
              'surname': this._surnameInputController.text,
              'Phone_Number': this._phoneNbrInputController.text,
            }, _idNumberInputController.text).catchError((e) {
              print(e);
            });
            print("Id Number : " + _idNumberInputController.text);
            print("First Name: " + _firstNameInputController.text);
            print("Surname: " + _surnameInputController.text);
            print("Phone Number: " + _phoneNbrInputController.text);

            // Display a success message
          }
        }
      } else if (this._currentStep >= _getSteps().length - 1) {
        if (_visitDetailsFormKey.currentState.validate()) {
          _stepStates[this._currentStep] = StepState.indexed;
          this._currentStep = _getSteps().length - 1;
          _stepStates[this._currentStep] = StepState.editing;
          obj.addVisits({
            'id_Number': this._idNumberInputController.text,
            'host': this._hostInputController.text,
            'vehicleReg': this._vehicleRegInputController.text,
            'purpose': this._purposeInputController.text,
          }).catchError((e) {
            print(e);
          });
          // TODO(ruth): Check in the visitor
          print("Host: " + _hostInputController.text);
          print("Host: " + _vehicleRegInputController.text);
          print("Host: " + _purposeInputController.text);
          _successSignedInDialog();
        }
      }
    });
  }

  _cancel() {
    setState(() {
      if (this._currentStep > 0) {
        _stepStates[this._currentStep] = StepState.indexed;
        this._currentStep -= 1;
        _stepStates[this._currentStep] = StepState.editing;
      } else {
        this._currentStep = 0;
      }
    });
  }

  Future<void> _successSignedInDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                // TODO:(c3n7) Display something more meaningful like:
                // You have been Checked-In at XXYYHrs
                Text('You have been signed in successfully.'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Okay'),
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
    return new Scaffold(
      appBar: AppBar(
        title: Text("Visitors"),
      ),
      drawer: NavigationDrawer(),
      body: SingleChildScrollView(
        child: Stepper(
          steps: _getSteps(),
          currentStep: this._currentStep,
          // onStepTapped: (step) {
          // setState(() {
          // this._currentStep = step;
          // });
          // },
          onStepContinue: _continue,
          onStepCancel: _cancel,
        ),
      ),
    );
  }
}
