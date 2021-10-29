import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_login/login_module/Screens/loginScreen.dart';
class GoogleSignInService{
  FirebaseAuth auth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn();
  Future signInWithGoogle() async{
  GoogleSignInAccount? _googleSignInAccount = await _googleSignIn.signIn();
    var _authentication = await _googleSignInAccount!.authentication;
    var _credential = GoogleAuthProvider.credential(
        idToken: _authentication.idToken,
        accessToken: _authentication.accessToken
    );

    User? user = (await auth.signInWithCredential(_credential)).user;
    return user;
  }
  Future SignOutWithGoogle(BuildContext context) async {
    await auth.signOut();
    await _googleSignIn.signOut();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
  }
}

