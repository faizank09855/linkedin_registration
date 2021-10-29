import 'package:flutter/material.dart';
import 'package:my_login/profile_module/Screen/welcomeStudentScreen.dart';

class RateUsScreen extends StatefulWidget {
  const RateUsScreen({Key? key}) : super(key: key);

  @override
  _RateUsScreenState createState() => _RateUsScreenState();
}

class _RateUsScreenState extends State<RateUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Rate Us"),
      ),
      body: SingleChildScrollView(
        child : Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Like using Astro Universe?",
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: Text(
                      "Astro Universe providers chat & \ncall feature allowing",
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Container(
                    width: 235,
                    height: 40,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8, horizontal: 8),
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Colors.orange,
                              Colors.deepOrange,
                              Colors.red,
                            ]),
                        border: Border.all(
                          style: BorderStyle.none,
                        ),
                        borderRadius:
                        const BorderRadius.all(Radius.circular(30))),
                    child: TextButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<
                            RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>WelcomeStudentScreen()));

                      },
                      child: const Text(
                        "Rate Us",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}