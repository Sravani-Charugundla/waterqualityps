
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'reset.dart';
import 'signup.dart';
import 'student.dart';
import 'welcome_Screen.dart';
import 'login.dart';
import 'output.dart';
import 'output2.dart';
void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  late List<num> auto = [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1];
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'signup',
    routes:
    {
      'signup':(context) => MyApp1(),
      'login':(context) => login(),
      'welcome_Screen':(context)=>inputpage(auto),
      'reset':(context)=>ResetScreen(),
    },
  ));
}
