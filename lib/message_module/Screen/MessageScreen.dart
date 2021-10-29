import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'MessageSend.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 32.0),
                child: Icon(Icons.videocam_sharp),
              )
            ],
            leadingWidth: 60,
            leading: Padding(
              padding: const EdgeInsets.only(left: 32.0),
              child: CircleAvatar(),
            ),
            title: const Text('  Bhupesh Prajapati'),
            backgroundColor: Colors.transparent,
            elevation: 0,
            foregroundColor: Colors.black,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(children: [
                    Container(
                      decoration: const BoxDecoration(
                          color: Color(0xC7EAEFF1),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40),
                              topLeft: Radius.circular(40))),
                      height: MediaQuery.of(context).size.height * 0.889,
                      width: double.infinity,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, right: 16.0, top: 600),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40)),
                        height: 48,
                        width: double.infinity,
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              suffix: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.orange,
                                      shape: BoxShape.circle),
                                  child: IconButton(
                                    icon: Icon(Icons.send),
                                    onPressed: () {},
                                  )),
                              prefix: Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Container(
                                    height: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.orange,
                                        shape: BoxShape.circle),
                                    child: IconButton(
                                      icon: Icon(Icons.add),
                                      onPressed: () {
                                       getName();}
                                    )),
                              )),
                        ),
                      ),
                    ),
                  ]), //
                ],
              ),
            ),
          ),
        ));
  }
}
