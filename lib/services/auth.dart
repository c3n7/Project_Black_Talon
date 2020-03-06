import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future signInAuth(String _email, String _password, BuildContext context) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  try {
    AuthResult result = await _auth.signInWithEmailAndPassword(
        email: _email, password: _password);
    FirebaseUser user = result.user;
    Navigator.pushReplacementNamed(context, '/home');
    return user.uid;
  } catch (e) {
    print(e.toString());
    return null;
  }
}

Future signUpAuth(String _email, String _password) async {
  FirebaseAuth _signUp = FirebaseAuth.instance;
  try {
    AuthResult result = await _signUp.createUserWithEmailAndPassword(
        email: _email, password: _password);
    FirebaseUser user = result.user;
    return user;
  } catch (e) {
    print(e.toString());
    return null;
  }
}
