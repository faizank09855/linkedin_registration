import 'package:flutter/material.dart';

class WelcomeStudentScreen extends StatefulWidget {
  const WelcomeStudentScreen({Key? key}) : super(key: key);

  @override
  _WelcomeStudentScreenState createState() => _WelcomeStudentScreenState();
}

class _WelcomeStudentScreenState extends State<WelcomeStudentScreen> {
  bool isHome = false, isWallet = false, isOrder= false, isSubscribe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Welcome"),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Card(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    side: BorderSide(width: 5, color: Colors.white)),
                elevation: 5,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .25,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Welcome !",
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 2),
                        child: Text(
                            "Start your journey by\n adding up profiles or family and friend.",
                            style: TextStyle(fontSize: 15),
                            textAlign: TextAlign.center),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8 , horizontal: 16),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height:  MediaQuery.of(context).size.height * 0.06,
                          margin: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 8),
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
                            onPressed: () {},
                            child: const Text(
                              "Add Profile",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
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
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                "3 more profiles can be added",
                style: TextStyle(fontSize: 22, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(padding: EdgeInsets.symmetric(horizontal: 40,vertical: 20),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isHome = !isHome;
                });
              },
              child: Card(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    side: BorderSide(width: 5, color: Colors.white)),
                elevation: 5,
                child: Container(
                  width: 60,
                  height: 60,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.home_outlined,
                        color: isHome ?
                        Colors.orange :
                        null,),
                      Text("Home",
                        style: isHome
                            ? TextStyle(color: Colors.orange)
                            : null,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isWallet = !isWallet;
                });
              },
              child: Card(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    side: BorderSide(width: 5, color: Colors.white)),
                elevation: 5,
                child: Container(
                  width: 60,
                  height: 60,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.account_balance_wallet_outlined,
                          color: isWallet ?
                          Colors.orange :
                          null),
                      Text("Home",
                        style: isWallet
                            ? TextStyle(color: Colors.orange)
                            : null,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isOrder = !isOrder;
                });
              },
              child: Card(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    side: BorderSide(width: 5, color: Colors.white)),
                elevation: 5,
                child: Container(
                  width: 60,
                  height: 60,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.shopping_bag_outlined,
                        color: isOrder ?
                        Colors.orange :
                        null,),
                      Text("Home",
                        style: isOrder
                            ? TextStyle(color: Colors.orange)
                            : null,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isSubscribe = !isSubscribe;
                });
              },
              child: Card(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    side: BorderSide(width: 5, color: Colors.white)),
                elevation: 5,
                child: Container(
                  width: 60,
                  height: 60,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.subscriptions_outlined,
                        color: isSubscribe ?
                        Colors.orange :
                        null,),
                      Text("Home",
                        style: isSubscribe
                            ? TextStyle(color: Colors.orange)
                            : null,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}