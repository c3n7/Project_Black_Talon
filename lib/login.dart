import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginFormKey = GlobalKey<FormState>();
  final TextEditingController _emailInputController =
      new TextEditingController();
  final TextEditingController _pwdInputController = new TextEditingController();

  Widget _buildEmailInputWidget() {
    return new Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: new TextFormField(
        controller: _emailInputController,
        validator: _emailValidator,
        decoration: InputDecoration(
          labelText: 'Email',
        ),
      ),
    );
  }

  String _emailValidator(String email) {
    if (email.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  Widget _buildPwdInputWidget() {
    return new Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: new TextFormField(
        controller: _pwdInputController,
        validator: _pwdValidator,
        decoration: InputDecoration(
          labelText: 'Password',
        ),
      ),
    );
  }

  String _pwdValidator(String pwd) {
    if (pwd.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  void _loginButtonPressed() {
    if (_loginFormKey.currentState.validate()) {
      print(_emailInputController.text + " : " + _pwdInputController.text);
      _emailInputController.clear();
      _pwdInputController.clear();
      Navigator.pushNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log In'),
      ),
      body: Form(
        key: _loginFormKey,
        child: Column(children: <Widget>[
          _buildEmailInputWidget(),
          _buildPwdInputWidget(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              onPressed: _loginButtonPressed,
              child: Text('Log In'),
            ),
          ),
        ]),
      ),
    );
  }
}
