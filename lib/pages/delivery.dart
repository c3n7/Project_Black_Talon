import 'package:flutter/material.dart';

import 'package:Project_Black_Talon/navigationdrawer.dart';

class DeliveryScreen extends StatefulWidget {
  _DeliveryScreenState createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<StatefulWidget> {
  final _idFormKey = GlobalKey<FormState>();
  final _bioFormKey = GlobalKey<FormState>();
  final _goodsDetailsFormKey = GlobalKey<FormState>();
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
  final TextEditingController _goodsDescriptionInputController =
      new TextEditingController();
  final TextEditingController _quantityInputController =
      new TextEditingController();
  final TextEditingController _quantityUnitTypeInputController =
      new TextEditingController();
  final TextEditingController _invoiceNbrInputController =
      new TextEditingController();
  final TextEditingController _destinationInputController =
      new TextEditingController();

  int _currentStep = 0;
  bool _accountPresent = false;

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

  String _goodsDescriptionValidator(String goods) {
    if (goods.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  String _quantityValidator(String quantity) {
    if (quantity.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  String _quantityUnitTypeValidator(String unitType) {
    if (unitType.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  String _invoiceNbrValidator(String invoice) {
    if (invoice.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  String _destinationValidator(String destination) {
    if (destination.isEmpty) {
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
        title: const Text('Goods Details'),
        isActive: _currentStep >= 1,
        state: _stepStates[1],
        content: _buildGoodsDetails(),
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

  Widget _buildGoodsDetails() {
    return new Form(
      key: _goodsDetailsFormKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: _goodsDescriptionInputController,
            validator: _goodsDescriptionValidator,
            decoration: InputDecoration(labelText: 'Goods Description'),
            maxLines: null,
            keyboardType: TextInputType.multiline,
          ),
          TextFormField(
            controller: _quantityInputController,
            validator: _quantityValidator,
            decoration: InputDecoration(labelText: 'Quantity'),
          ),
          TextFormField(
            controller: _quantityUnitTypeInputController,
            validator: _quantityUnitTypeValidator,
            decoration: InputDecoration(labelText: 'Quantity Unit Type'),
          ),
          TextFormField(
            controller: _invoiceNbrInputController,
            validator: _invoiceNbrValidator,
            decoration: InputDecoration(labelText: 'Invoice Number'),
          ),
          TextFormField(
            controller: _destinationInputController,
            validator: _destinationValidator,
            decoration: InputDecoration(labelText: 'Destination'),
          ),
        ],
      ),
    );
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
      } else if (this._currentStep == 1) {
        // The second step
        if (_accountPresent) {
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
            print("Id Number : " + _idNumberInputController.text);
            print("First Name: " + _firstNameInputController.text);
            print("Surname: " + _surnameInputController.text);
            print("Phone Number: " + _phoneNbrInputController.text);

            // Display a success message
          }
        }
      } else if (this._currentStep >= _getSteps().length - 1) {
        if (_goodsDetailsFormKey.currentState.validate()) {
          _stepStates[this._currentStep] = StepState.indexed;
          this._currentStep = _getSteps().length - 1;
          _stepStates[this._currentStep] = StepState.editing;

          // TODO(ruth): Check in the goods
          print("Goods: " + _goodsDescriptionInputController.text);
          print("Quantity: " + _quantityInputController.text);
          print("Quantity Unit Type: " + _quantityUnitTypeInputController.text);
          print("Invoice Number: " + _invoiceNbrInputController.text);
          print("Invoice Number: " + _destinationInputController.text);
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
                Text('Data submitted successfully.'),
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
        title: Text("Deliveries"),
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
