import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_login/homeScreen_module/homeScreen.dart';
import 'login_module/Screens/loginScreen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'login_module/Services/loginService.dart';

Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  var user;
  void userCheck() async{
    user = await auth.userChanges();
    if(user!= null){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => HomeScreen())); }
    else{

      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => LoginScreen()));
    }

    }


  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(seconds: 3),
        () => userCheck());
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 200,),
            Container(height: 130, width: 130, child: Image.asset('assets/linkedin.png' ,fit: BoxFit.fill,)),
            Text('Faizan' , style: const TextStyle(fontSize: 24 , color: Colors.blue , fontWeight: FontWeight.bold),),

          ],
        ),
      ),
    );
  }
}
