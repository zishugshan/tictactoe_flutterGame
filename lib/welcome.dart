import 'package:flutter/material.dart';
import 'package:nullcrossgame/utils/routes.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  String name1 = "";
  String name2 = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 20.0,
                ),
                Image.asset(
                  "assets/images/welcome.jpeg",
                  fit: BoxFit.contain,
                ),
                SizedBox(
                  height: 2.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30.0,left: 30.0),
                  child: Column(
                    children: 
                    [
                      Text(
                      "$name1",
                      style: TextStyle(
                        color: Color(0xFFfc03e3),
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                      Text(
                      "V/s",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                      Text(
                      "$name2",
                      style: TextStyle(
                        color: Color(0xFFfc03e3),
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    ],
                  ),
                ),
                SizedBox(
                  height: 2.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 32.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter Your Name",
                          labelText: "YourName",
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Your name cannot be empty";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          name1 = value;
                          setState(() {});
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter Your opponent/computer Name",
                          labelText: "OpponentName",
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Your OpponentName cannot be empty";
                          }
                          return null;
                        },
                        onChanged: (value2) {
                          name2 = value2;
                          setState(() {});
                        },
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Material(
                        color: Colors.black,
                        borderRadius:
                            BorderRadius.circular(changeButton ? 50 : 8),
                        child: InkWell(
                          onTap: () => moveToHome(context),
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            width: changeButton ? 50 : 150,
                            height: 50,
                            alignment: Alignment.center,
                            child: changeButton
                                ? Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : Text(
                                    "Play",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
