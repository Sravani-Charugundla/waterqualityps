import 'dart:ui';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_core/firebase_core.dart';

import 'login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp1());
}
class MyApp1 extends StatefulWidget {
  @override
  State<MyApp1> createState() => _MyApp1State();
}
class _MyApp1State extends State<MyApp1> {
  // TextEditingController emailController=TextEditingController();
  final _messangerKey = GlobalKey<ScaffoldMessengerState>();
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  void signup() async {
    print( _emailController.text);
    print(_passwordController.text);
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
          Navigator.pushNamed(context,'welcome_Screen');
    }
    catch (e) {
      SnackBar snackbar = SnackBar(
        content:  Text("Couldnot login!!!"),
        backgroundColor: Colors.grey,
        action: SnackBarAction(
          label: 'dismiss',
          textColor: Colors.lightBlueAccent,
          onPressed: () {},
        ),
      );
      _messangerKey.currentState?.showSnackBar(
          snackbar);
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: _messangerKey,
      home: SafeArea(
      child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //         backgroundColor: Colors.cyan,
      //         elevation: 0.0,
      //         title: Text("Register",
      //           style: TextStyle(
      //             fontFamily: 'Lora/Lora-Bolditalic.tff'
      //
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
       image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8pejx1yszlNNmsPpdWGZpImBmqYMSN-cwvqFUHy7NQ2-f_hPvdLd6-nbKjIKj1hpHlZk&usqp=CAU'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(image:
                          NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8pejx1yszlNNmsPpdWGZpImBmqYMSN-cwvqFUHy7NQ2-f_hPvdLd6-nbKjIKj1hpHlZk&usqp=CAU"),
                              fit: BoxFit.cover)
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 2,sigmaY: 2),
                        child: Container(
                          color: Colors.grey.withOpacity(0.1),
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
              Container(
              padding: EdgeInsets.fromLTRB(8, 4.00, 10.00, 115.01),
              margin: EdgeInsets.fromLTRB(6.5, 5, 0, 5),
              child: Text(
                'Register',
                style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold, color: Colors.black,fontFamily: 'Lora'),

              ),
            ),

            Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: TextFormField(
                controller: _emailController,

                style: TextStyle(fontSize: 15),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0),
                      borderSide: BorderSide(
                          color: Colors.white,
                          width: 2),
                  ),
              prefixIcon: Icon(
                Icons.mail_outlined,
                color: Colors.blue,
              ),
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    color:
                      Colors.black,
                    fontSize: 15.5,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.0),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2
                    )
                  ),
                  labelText: 'password',
                  prefixIcon: Icon(
                    Icons.key,
                    color: Colors.blue,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 15.5,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
                    SizedBox(height: 35,),
                    ElevatedButton(
                    onPressed:() {
                      signup();
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                ),
                child: Text(
                  '   Register   ',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white
                  ),
                ),
              ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                // Text('??',style: TextStyle(
                //   color: Colors.pink,
                //   fontWeight: FontWeight.bold,
                //   fontSize: 19
                // ),),
                TextButton(onPressed: () {
                  Navigator.pushNamed(context, 'login');
                } , child: Text(
                  "Log In",
                  style: TextStyle(
                      fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),
                ),
                ),
              ],
            ),


        ],
      ),
    ),
    ),
    ),
    );
  }
}


