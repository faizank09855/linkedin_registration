import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_login/homeScreen_module/homeScreen.dart';

class LoginSuccessfulScreen extends StatelessWidget {
  const LoginSuccessfulScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Timer(
        Duration(seconds: 3),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen())));
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      home:Scaffold(
        body : Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/login_successful.png' , width: 100, fit: BoxFit.fill,),
               const SizedBox(height:  10,),
               const Text('Login Successful' , style: TextStyle(color: Color.fromRGBO(40,103,178 ,1) , fontSize: 18 ),)
            ],
          ),
        )
      )
    );
  }
}
