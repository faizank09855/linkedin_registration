import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_login/login_module/Screens/loginSuccessScreen.dart';
import 'package:my_login/login_module/Screens/registrationScreen.dart';
import 'package:my_login/login_module/Services/loginService.dart';
import 'package:my_login/login_module/Services/GoogleSignInService.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Color myTheme=Color.fromRGBO(40,103,178 ,1);
  bool waiting = true ;
  final LoginService _loginService = LoginService();
  final GoogleSignInService _googleSignInService = GoogleSignInService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool obScure = true;
  var obScureIcon = Icons.remove_red_eye_outlined;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          foregroundColor: myTheme,
          backgroundColor: Colors.transparent,
          actions: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextButton(
                child: Text(
                  'Join now',
                  style: TextStyle(color: myTheme,
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> RegistrationScreen()));
                },
              ),
            )
          ],
        ),
        body:waiting == true ? SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text('Sing in',
                    style:
                        TextStyle(fontSize: 32, fontWeight: FontWeight.w700)),
                SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    fontSize: 16,
                  ),
                )), // email
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _passwordController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  obscureText: obScure,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: InkWell(
                          onTap: () => setState(() {
                                obScure ? obScure = false : obScure = true;
                                obScureIcon == Icons.remove_red_eye_outlined
                                    ? obScureIcon = Icons.remove_red_eye
                                    : obScureIcon =
                                        Icons.remove_red_eye_outlined;
                              }),
                          child: Icon(obScureIcon))),
                ), // password
                const SizedBox(height: 40),
                TextButton(onPressed: () {}, child: Text('Forgot password?' , style: TextStyle(color: const Color.fromRGBO(40,103,178, 1)),)),
                const SizedBox(height: 4),
                Container(
                  height: 48,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        primary: myTheme),
                    child: Text(
                      'Continue',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () async{
                     setState(() {
                       waiting = false ;
                     });
                     await _loginService.myLoginService(context, _emailController.text, _passwordController.text);
                      setState(() {
                        waiting = true ;
                      });
                     },
                  ),
                ), // login button
                SizedBox(
                  height: 20,
                ),
                Row(children: const <Widget>[
                  Expanded(child: Divider(thickness: 1)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(" or "),
                  ),
                  Expanded(child: Divider(thickness: 1)),
                ]),// or-divider
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 48,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(
                            side:
                                BorderSide(color: Colors.black54, width: 1.4)),
                        primary: Colors.white), // google sing
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/googleIcon.png',
                          height: 22,
                          width: 22,
                        ),
                        Text(
                          '  Sing in with Google',
                          style: TextStyle(fontSize: 20, color: Colors.black54),
                        ),
                      ],
                    ),
                    onPressed: () {
                      _googleSignInService.signInWithGoogle().then((user) {
                        if (user != null) {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginSuccessfulScreen()));
                        }
                      }
                     );
                   },
                  ),
                ), // google button
              ],
            ),
          ),
        ) : Center(child: CircularProgressIndicator(color: myTheme, )),
      ),
    );
  }
}