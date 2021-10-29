

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

FirebaseAuth auth = FirebaseAuth.instance;
class RegistrationService {
  myRegistration(String email,String password,BuildContext context) async {
    try {
      UserCredential




      userCredential =  await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Navigator.pop(context);
    } catch (error) {
      errorMessageAlert(context, error);
    }
  }

  errorMessageAlert(BuildContext context,dynamic error) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Alert'),
            content: Text(error.toString()),
          );
        }
    );
  }
}
