import 'dart:async';
import 'package:flutter/material.dart';
import 'login_module/Screens/loginScreen.dart';
import 'package:firebase_core/firebase_core.dart';

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

  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen())));
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
