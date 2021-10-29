import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_login/login_module/Screens/loginSuccessScreen.dart';
FirebaseAuth auth =FirebaseAuth.instance;
class LoginService{
  myLoginService(BuildContext context ,String email ,String password) async{
    try {
      UserCredential user = await auth.signInWithEmailAndPassword(
          email: email, password: password);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginSuccessfulScreen()));
    }catch(error){
      errorMessageAlert(context , error);
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