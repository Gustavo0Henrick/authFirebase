import 'package:auth_firebase/src/modules/auth/login/login_page.dart';
import 'package:auth_firebase/src/modules/auth/register/register_page.dart';
import 'package:auth_firebase/src/modules/home/home_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/login",
      routes: {
        "/login": (context) => LoginPage(),
        "/home": (context) => HomePage(),
        "/register": (context) => RegisterPage(),
      },
    );
  }
}
