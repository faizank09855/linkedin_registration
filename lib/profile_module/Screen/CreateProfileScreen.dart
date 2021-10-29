import 'package:flutter/material.dart';

class StudentDetailScreen extends StatefulWidget {
  const StudentDetailScreen({Key? key}) : super(key: key);

  @override
  _StudentDetailScreenState createState() => _StudentDetailScreenState();
}

class _StudentDetailScreenState extends State<StudentDetailScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  String name='',age='';
  Object selectRelation = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Profile"),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },
            icon: Icon(Icons.arrow_back)),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal:130, vertical: 30),
              child: CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage("assets/profile.png"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: TextFormField(
                controller: nameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Enter Your Name",
                  labelText: "Name",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
              child: DropdownButton(
                  isExpanded: true,
                  value: selectRelation,
                  borderRadius: BorderRadius.circular(10),
                  items: const [
                    DropdownMenuItem(
                      child: Text("Relation"),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      child: Text("Brother"),
                      value: 2,
                    ),
                    DropdownMenuItem(
                      child: Text("Sister"),
                      value: 3,
                    ),
                    DropdownMenuItem(
                      child: Text("Mother"),
                      value: 4,
                    ),
                    DropdownMenuItem(
                      child: Text("Father"),
                      value: 5,
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectRelation = value!;
                    });
                  },
                  hint:Text("Select item")
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical:10),
              child: TextFormField(
                controller: ageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Enter Your Age",
                  labelText: "Age",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15,horizontal: 30),
              child: Container(
                width: 250,
                height: MediaQuery.of(context).size.height*.05,
                margin: const EdgeInsets.symmetric(
                    vertical: 6, horizontal: 8),
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
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Add",
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
    );
  }
}