import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_login/homeScreen_module/homeScreen.dart';
import 'package:my_login/login_module/Services/RegistrationService.dart';
import 'package:my_login/login_module/Services/GoogleSignInService.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool obScure = true;
  var obScureIcon = Icons.remove_red_eye_outlined;
  RegistrationService registrationService = RegistrationService();
  GoogleSignInService googleSignInService = GoogleSignInService();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          foregroundColor: Color(0xff2867B2),
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text('Join Linkedin',
                    style:
                    TextStyle(fontSize: 32, fontWeight: FontWeight.w600)),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // crossAxisAlignment: CrossAxisAlignment.,
                  textDirection: TextDirection.ltr,
                  children: [
                    Text('or', style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),),
                    TextButton(onPressed: () {
                      Navigator.pop(context);
                    },
                        child: Text('sign in', style: TextStyle(fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(40, 103, 178, 1)))),
                  ],
                ),
                SizedBox(height: 4,),
                TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        fontSize: 16,
                      ),
                    )),
                SizedBox(height: 24,),
                TextField(
                  controller: _passwordController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  obscureText: obScure,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: InkWell(
                          onTap: () =>
                              setState(() {
                                obScure ? obScure = false : obScure = true;
                                obScureIcon == Icons.remove_red_eye_outlined
                                    ? obScureIcon = Icons.remove_red_eye
                                    : obScureIcon =
                                    Icons.remove_red_eye_outlined;
                              }),
                          child: Icon(obScureIcon))),
                ),
                SizedBox(height: 40),

                SizedBox(height: 4),
                Container(
                  height: 48,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        primary: Color.fromRGBO(40, 103, 178, 1)),
                    child: Text(
                      'Continue',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      registrationService.myRegistration(
                          _emailController.text, _passwordController.text,
                          context);
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(children: const <Widget>[
                  Expanded(child: Divider(thickness: 1)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(" or "),
                  ),
                  Expanded(child: Divider(thickness: 1)),
                ]),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 48,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(
                            side:
                            BorderSide(color: Colors.black54, width: 1.4)),
                        primary: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/googleIcon.png',
                          height: 22,
                          width: 22,
                        ),
                        const Text(
                          '  Sing in with Google',
                          style: TextStyle(fontSize: 20, color: Colors.black54),
                        ),
                      ],
                    ),
                    onPressed: () {
                      googleSignInService.signInWithGoogle().then((user) {
                        if (user != null) {
                          Navigator.pushReplacement(context, MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                        }
                      });
                    },
                  ),
                ), // googleSign Button
              ],
            ),
          ),
        ),
      ),
    );
  }
}
