import 'package:flutter/material.dart';
import 'package:nullcrossgame/utils/routes.dart';
class Welcome  extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome > {
  String name = "";
  bool changeButton = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/welcome.jpeg",
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Lets start $name",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter Your Nmae",
                        labelText: "YourName",
                      ),
                      onChanged: (value){
                        name = value;
                        setState(() { });
                      },
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    InkWell(
                      onTap: () async {
                        setState(() {
                          changeButton = true;
                        });
                        await Future.delayed(Duration(seconds: 1));
                        Navigator.pushNamed(context, MyRoutes.homeRoute);
                      },
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
                          decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: 
                            BorderRadius.circular(changeButton ? 50 : 8),
                          
                        
                        
                       ),
                      ),
                    ),
                  ],
                ),
             )
          ],
        ),
      )
    );
  }
}
