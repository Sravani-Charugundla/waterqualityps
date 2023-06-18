
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class AfterLogin extends StatefulWidget {
  const AfterLogin({Key? key}) : super(key: key);
  @override
  State<AfterLogin> createState() => _AfterLoginState();
}
class _AfterLoginState extends State<AfterLogin> {
  int currIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Text(
          "Welcome User",
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}