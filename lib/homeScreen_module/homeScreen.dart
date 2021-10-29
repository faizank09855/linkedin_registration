import 'package:flutter/material.dart';
import 'package:my_login/login_module/Services/GoogleSignInService.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_login/message_module/Screen/MessageScreen.dart';
import 'package:my_login/payment_module/paymentScreen.dart';

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
        appBar:AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor:const Color.fromRGBO(40, 103, 178, 1),
          elevation: 0,
          title:const Text('HomePage'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.push(context , MaterialPageRoute(builder: (context)=>PaymentScreen()));
                },
                child:const Text('Payment')),
            TextButton(
                onPressed: () {
                  googleSignInService.SignOutWithGoogle(context);
                },
                child:const Text('Sign Out'))
          ],
        ),
        body: SafeArea(
          // child: Padding(
          //   padding: const EdgeInsets.all(20),
          child: ListView.builder(
            primary: true,
            itemCount: 5,
            physics: ScrollPhysics(),
            itemBuilder: (context, index) => Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24),
              child: Dismissible(
                onDismissed: (DismissDirection direction) =>
                    ScaffoldMessenger.of(context).showSnackBar(snackbar()),
                key: UniqueKey(),
                background: Row(
                  children: const [
                   Icon(Icons.delete , color: Colors.red,),
                  ],
                ),
                secondaryBackground:Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                  Icon(Icons.delete , color: Colors.red,),
                  ],
                ),
                child: Stack(
                  children: [
                    InkWell(
                      onTap:()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>MessageScreen())),
                      child: Card(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            side: BorderSide(width: 5, color: Colors.white)),
                        elevation: 5,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.19,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 5),
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
            ),
          ),
        ),
      ),
      // )
    );
  }
}
