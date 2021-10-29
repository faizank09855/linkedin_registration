import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_login/message_module/Screen/MessageScreen.dart';

FirebaseAuth auth = FirebaseAuth.instance;

Future<void> getName ()async
{  try {
  User? user = await auth.currentUser;
  String name = user!.displayName.toString();
  String IdUser = user.uid.toString();
  print(name);
  String date = DateTime.now().toString();
  await FirebaseFirestore.instance.collection('chat/$IdUser/message').doc().set({date : name});

}catch(e){print(e.toString());}
}
// FirebaseFirestore firestore = FirebaseFirestore.instance.collection('message')