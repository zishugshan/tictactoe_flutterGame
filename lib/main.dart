import 'package:flutter/material.dart';
import 'package:nullcrossgame/home_page.dart';
import 'package:nullcrossgame/utils/routes.dart';
import 'package:nullcrossgame/welcome.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.red[800]),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => Welcome(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.welcomeRoute: (context) => Welcome()
      },
    );
  }
}
