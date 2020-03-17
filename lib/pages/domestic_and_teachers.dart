import 'package:flutter/material.dart';

import 'package:Project_Black_Talon/navigationdrawer.dart';

class DomesticAndTeachersScreen extends StatefulWidget {
  _DomesticAndTeachersState createState() => _DomesticAndTeachersState();
}

class _DomesticAndTeachersState extends State<StatefulWidget> {
  int _currentStep = 0;
  bool _accountPresent = false;
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
        content: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Id number'),
            ),
          ],
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
      return new Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'First Name'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Surname'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Phone Number'),
          ),
        ],
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
      if (this._currentStep < this._getSteps().length - 1) {
        _stepStates[this._currentStep] = StepState.indexed;
        this._currentStep += 1;
        _stepStates[this._currentStep] = StepState.editing;
      } else {
        _signedInDialog();
        print("Completed, check fields");
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

  Future<void> _signedInDialog() async {
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
