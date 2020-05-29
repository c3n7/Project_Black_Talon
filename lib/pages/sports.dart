import 'package:flutter/material.dart';
import 'package:Project_Black_Talon/navigationdrawer.dart';
import 'package:Project_Black_Talon/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SportsScreen extends StatefulWidget {
  _SportsScreenState createState() => _SportsScreenState();
}

class _SportsScreenState extends State<StatefulWidget> {
  final _idFormKey = GlobalKey<FormState>();
  final _bioFormKey = GlobalKey<FormState>();
  final _vehicleDetailsFormKey = GlobalKey<FormState>();
  final _additionalDetailsFormKey = GlobalKey<FormState>();
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
  final TextEditingController _gameInputController =
      new TextEditingController();
  final TextEditingController _nbrOfOccupantsInputController =
      new TextEditingController();

  int _currentStep = 0;
  bool _accountPresent = false;
  String _firstName = "";
  String _surname = "";
  String _phoneNbr = "";

  CrudMethods obj = CrudMethods();

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
    if (vehicleReg.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  String _gameValidor(String game) {
    if (game.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  String _nbrOfOccupantsValidator(String nbrOfOccupants) {
    if (nbrOfOccupants.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  List<StepState> _stepStates = [
    StepState.editing,
    StepState.indexed,
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
        title: const Text('Vehicle Details'),
        isActive: _currentStep >= 2,
        state: _stepStates[2],
        content: _buildVehicleDetails(),
      ),
      Step(
        title: const Text('Additional Details'),
        isActive: _currentStep >= 3,
        state: _stepStates[3],
        content: _buildAdditionalDetails(),
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
                  _firstName,
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
                  _surname,
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
                  _phoneNbr,
                ),
              ],
            ),
          ),
        ],
      );
    }
  }

  Widget _buildVehicleDetails() {
    return new Form(
      key: _vehicleDetailsFormKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: _vehicleRegInputController,
            validator: _vehicleRegValidator,
            decoration:
                InputDecoration(labelText: 'Vehicle Registration Number'),
          ),
          TextFormField(
            controller: _nbrOfOccupantsInputController,
            validator: _nbrOfOccupantsValidator,
            decoration: InputDecoration(labelText: 'Number of Occupants'),
          ),
        ],
      ),
    );
  }

  Widget _buildAdditionalDetails() {
    return new Form(
      key: _additionalDetailsFormKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: _gameInputController,
            validator: _gameValidor,
            decoration: InputDecoration(labelText: 'Game'),
            maxLines: null,
            keyboardType: TextInputType.multiline,
          ),
        ],
      ),
    );
  }

  Future<void> checkExists(String idNumber) async {
    final DocumentSnapshot snapShot = await Firestore.instance
        .collection('sports_person')
        .document(idNumber)
        .get();
    if (snapShot.exists) {
      print("Account Exists");
      setState(() {
        _accountPresent = true;
        _firstName = snapShot.data['first_name'];
        _surname = snapShot.data['surname'];
        _phoneNbr = snapShot.data['phone_number'];
      });
    } else {
      print("Account not exist");
      setState(() {
        _accountPresent = false;
      });
    }

    setState(() {
      _stepStates[this._currentStep] = StepState.indexed;
      this._currentStep += 1;
      print("Current Step" + this._currentStep.toString());
      _stepStates[1] = StepState.editing;
    });
  }

  _continue() {
    if (this._currentStep == 0) {
      // The ID Number entry form
      if (_idFormKey.currentState.validate()) {
        print("Id Number : " + _idNumberInputController.text);
        checkExists(_idNumberInputController.text);
      }
    } else if (this._currentStep == 1) {
      // The second step
      if (_accountPresent) {
        // TODO(c3n7) Move the vehicle step to its on step
        // Do nothing, the checkExists fn takes care of this
        setState(() {
          _stepStates[this._currentStep] = StepState.indexed;
          this._currentStep += 1;
          _stepStates[this._currentStep] = StepState.editing;
        });
      } else {
        if (_bioFormKey.currentState.validate()) {
          setState(() {
            _stepStates[this._currentStep] = StepState.indexed;
            this._currentStep += 1;
            _stepStates[this._currentStep] = StepState.editing;
          });
          // TODO(ruth): The account for the bio doesn't exist, react appropriately
          obj.addSportsPerson({
            'First_Name': this._firstNameInputController.text,
            'Surname': this._surnameInputController.text,
            'Phone_Number': this._phoneNbrInputController.text
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
    } else if (this._currentStep == 2) {
      if (_vehicleDetailsFormKey.currentState.validate()) {
        setState(() {
          _stepStates[this._currentStep] = StepState.indexed;
          this._currentStep += 1;
          _stepStates[this._currentStep] = StepState.editing;
        });
      }
    } else if (this._currentStep >= _getSteps().length - 1) {
      if (_additionalDetailsFormKey.currentState.validate()) {
        setState(() {
          _stepStates[this._currentStep] = StepState.indexed;
          this._currentStep = _getSteps().length - 1;
          _stepStates[this._currentStep] = StepState.editing;
        });
        // TODO(ruth): Send data
        obj.updateSports({
          'First_Name': this._firstNameInputController.text,
          'Surname': this._surnameInputController.text,
          'Phone_Number': this._phoneNbrInputController.text,
          'Vehicle_Reg_No': this._vehicleRegInputController.text,
          'Number_of_Occupants': this._nbrOfOccupantsInputController.text,
          'Game': this._gameInputController.text,
          'Arrival_Time': Timestamp.now()
        }, _idNumberInputController.text).catchError((e) {
          print(e);
        });
        print("Vehicle: " + _vehicleRegInputController.text);
        print("Nbr of Occupants: " + _nbrOfOccupantsInputController.text);
        print("Game: " + _gameInputController.text);
        _successSignedInDialog();
      }
    }
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
                Text('Data submitted successfully.'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Okay'),
              onPressed: () {
                _idNumberInputController.clear();
                _firstNameInputController.clear();
                _surnameInputController.clear();
                _phoneNbrInputController.clear();
                _vehicleRegInputController.clear();
                _gameInputController.clear();
                _nbrOfOccupantsInputController.clear();
                setState(() {
                  _stepStates[this._currentStep] = StepState.indexed;
                  this._currentStep = 0;
                  _stepStates[this._currentStep] = StepState.editing;
                });
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
        title: Text("Sports"),
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
