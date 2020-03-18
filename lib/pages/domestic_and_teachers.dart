import 'package:flutter/material.dart';

import 'package:Project_Black_Talon/navigationdrawer.dart';

class DomesticAndTeachersScreen extends StatefulWidget {
  _DomesticAndTeachersState createState() => _DomesticAndTeachersState();
}

class _DomesticAndTeachersState extends State<StatefulWidget> {
  final _idFormKey = GlobalKey<FormState>();
  final _bioFormKey = GlobalKey<FormState>();
  final TextEditingController _idNumberInputController =
      new TextEditingController();
  final TextEditingController _firstNameInputController =
      new TextEditingController();
  final TextEditingController _surnameInputController =
      new TextEditingController();
  final TextEditingController _phoneNbrInputController =
      new TextEditingController();

  int _currentStep = 0;
  bool _accountPresent = false;

  String _idNumberValidator(String idNumber) {
    return null;
  }

  String _firstNameValidator(String idNumber) {
    return null;
  }

  String _surnameValidator(String idNumber) {
    return null;
  }

  String _phoneNbrValidator(String idNumber) {
    return null;
  }

  List<StepState> _stepStates = [
    StepState.editing,
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
        ],
      );
    }
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

          // TODO(ruth): Check if the ID is in firebase then modify:
          _accountPresent = false;
        }
      } else {
        // The second step
        if (_accountPresent) {
          // TODO(ruth): The account for the bio exists, react appropriately
        } else {
          if (_bioFormKey.currentState.validate()) {
            // TODO(ruth): The account for the bio doesn't exist, react appropriately
            print("Id Number : " + _idNumberInputController.text);
            print("First Name: " + _firstNameInputController.text);
            print("Surname: " + _surnameInputController.text);
            print("Phone Number: " + _phoneNbrInputController.text);
          }
        }
        // Display a success message
        _successSignedInDialog();
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
                Text('You have been signed in successfully.'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Okay'),
              onPressed: () {
                print("Oh no!!");
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
        title: Text("Domestic and Teachers"),
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
