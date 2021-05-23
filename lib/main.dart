import 'package:flutter/material.dart';
import 'Login_Page.dart';
import 'Registration.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Demo App",
      theme: ThemeData(primaryColor: Colors.blueAccent),
      debugShowCheckedModeBanner: false,
      home: Login_Page(),
      initialRoute: '/',
      routes: {
        '/registration': (context) => Registration(),
        '/login': (context) => Login_Page(),
      },
    );
  }
}
