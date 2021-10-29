import 'package:flutter/material.dart';

import 'package:my_login/login_module/Services/GoogleSignInService.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_login/message_module/Screen/MessageScreen.dart';
import 'package:my_login/payment_module/paymentScreen.dart';
import 'package:my_login/profile_module/Screen/CreateProfileScreen.dart';
import 'package:my_login/profile_module/Screen/RateUsScreen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  GoogleSignInService googleSignInService = GoogleSignInService();

  void myToast(){
    Fluttertoast.showToast(
        msg: 'This is toast notification',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.yellow
    );
  } // toast
  Widget rowData(String text) {
    return Row(
      children: [
        const Icon(Icons.check_box_outline_blank),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(text),
        ),
      ],
    );
  }
  Widget icons() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            child: const Icon(Icons.edit),
            onTap: () { myToast(); },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GestureDetector(
              child: const Icon(Icons.delete),
              onTap: () { myToast(); },
            ),
          ),
          GestureDetector(
            child: const Icon(Icons.share),
            onTap: () {myToast();},
          ),
        ],
      ),
    );
  }

      SnackBar snackbar() => SnackBar(
        action: SnackBarAction(
        label: 'Undo' , textColor: Colors.white,
        onPressed: () {
        setState(() {});
        },
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: const Color.fromRGBO(40, 103, 178, 1),
      content: const Text('Item deleted'));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(child:Text("Profile"),),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child:IconButton(
                onPressed: (){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => StudentDetailScreen(),),);
                },
                icon: Icon(Icons.add_circle_outlined,size: 40),),),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(13),
                child: Stack(
                  children: [
                    Card(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          side: BorderSide(width: 5, color: Colors.white)),
                      elevation: 5,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height*0.2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Container(
                                    width: 70,
                                    height: 70,
                                    decoration: const BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(4),
                                      child: CircleAvatar(
                                        backgroundImage:
                                        AssetImage("assets/profile.png"),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        const Text(
                                          "Anil Goswamwe",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        rowData("Daughter"),
                                        rowData("4 Year"),
                                        icons(),
                                      ]),
                                ),
                              ],
                            ),
                            const Padding(
                              padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 13),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: CircleAvatar(
                                    radius: 10,
                                    backgroundColor: Colors.green,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          height: 25,
                          width: 100,
                          child: const Center(
                            child: Text("Primary"),
                          ),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            color: Colors.deepOrange,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 13),
                child:Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      side: BorderSide(width: 5, color: Colors.white)),
                  elevation: 5,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*0.2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Container(
                                width: 70,
                                height: 70,
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(4),
                                  child: CircleAvatar(
                                    backgroundImage:
                                    AssetImage("assets/profile.png"),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text(
                                      "Anil Goswamwe",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    rowData("Daughter"),
                                    rowData("4 Year"),
                                    icons(),
                                  ]),
                            ),
                          ],
                        ),
                        const Padding(
                          padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: CircleAvatar(
                                radius: 10,
                                backgroundColor: Colors.green,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 30),
                child: Text(
                  "3 more profiles can be added",
                  style: TextStyle(fontSize: 25, color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(vertical: 15,horizontal: 30),
          child: Container(
            width: 170,
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=>RateUsScreen()));
              },
              child: const Text(
                "Continue",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ),
      // )
    );
  }
}
