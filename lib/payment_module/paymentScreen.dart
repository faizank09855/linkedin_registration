import 'package:flutter/material.dart';
class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  Color walletColor = Colors.lightGreen;
  Color inAppColor = Colors.black45;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
          appBar : AppBar(),
          body: SingleChildScrollView(
            child: Column(
            children: [
              Container(

                width: double.infinity,
              decoration: BoxDecoration(
        gradient: LinearGradient(
                colors: <Color>[ Color(0xffee0000),
                Color(0xffeeee00)],
              ),

              ),
                child : SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height : MediaQuery.of(context).size.height * 0.4),
                      Container(
                        // height: MediaQuery.of(context).size.height * 0.86772,
                        decoration: BoxDecoration( borderRadius: BorderRadius.only(topLeft:  Radius.circular(20) , topRight:  Radius.circular(20)), color: Color(
                            0xffe6e7e6)),
                        child : Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(children: [
                            SizedBox(height: 20,),
                            Text('how would You Like to pay For Your Query' , style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),),
                            SizedBox(height: 40,),
                            Container(
                              height: 48,
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(elevation: 8,
                                  shape: StadiumBorder(
                                      ),
                                  primary: Colors.white), // google sing

                                onPressed: () {
                                  setState(() {
                                    walletColor = Colors.green ;
                                    inAppColor = Colors.black45;
                                        });
                              }, child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal : 16.0),
                                child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Wallet 1000' , style: TextStyle(color: Colors.black45),),
                                     CircleAvatar(backgroundColor: walletColor, radius: 10,)
                                  ],
                                ),
                              ),
                            ),
                          ),//wallet $1000
                            SizedBox(height: 20,),
                            Container(
                              height: 48,
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(elevation: 8,
                                    shape: StadiumBorder(
                                    ),
                                    primary: Colors.white), // google sing

                                onPressed: () {
                                  setState(() {
                                    inAppColor = Colors.green ;
                                    walletColor = Colors.black45;
                                  });
                                }, child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal : 16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('In-App Purchase' , style: TextStyle(color: Colors.black45),),
                                    CircleAvatar(backgroundColor: inAppColor, radius: 10,)
                                  ],
                                ),
                              ),
                              ),
                            ), // in-App Purchase
                            SizedBox(height: 48,),
                            InkWell(
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), gradient: LinearGradient(colors: <Color>[Color(0xffeeee00),
                                  Color(0xffee0000)])),
                                height: 48,
                                width: double.infinity,
                                child: Text('Done' , style: TextStyle(color: Colors.white , fontSize: 18),),
                              ),
                              onTap: (){},
                            ),//done
                            SizedBox(height : MediaQuery.of(context).size.height * 0.0291)
                          ],),
                        )
                      ),
                    ],
                  ),
                )
              ),
               ],
        ),
          ))
    );
  }
}