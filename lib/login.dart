// import 'package:flutter/material.dart';
// // import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
// import 'homescreen.dart';
// class MyLogin extends StatefulWidget {
//   const MyLogin({Key? key}) : super(key: key);
//   @override
//   _MyLoginState createState() => _MyLoginState();
// }
// class _MyLoginState extends State<MyLogin> {
//   firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();
//   void signup() async {
//     FocusManager.instance.primaryFocus?.unfocus();
//     var snackbar = SnackBar(content: Text('Couldnt login!! please try again'));
//     try {
//       firebase_auth.UserCredential userCredential =
//       await firebaseAuth.signInWithEmailAndPassword(
//           email: _emailController.text, password: _passwordController.text);
//       print("Logged");
//       Navigator.push(context, MaterialPageRoute(builder: (context)=>AfterLogin()));
//     }
//     catch(e){
//       ScaffoldMessenger.of(context).showSnackBar(snackbar);
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         // decoration: BoxDecoration(
//         //   image: DecorationImage(
//         //       image: AssetImage('assets/d5898ae37df930cfa3909f41cdc60786.jpg'
//         //       ),
//         //       fit: BoxFit.cover),),
//         child:
//         Scaffold(
//           backgroundColor: Colors.transparent,
//           body: Stack(
//             children: [
//               Container(
//                 padding: EdgeInsets.only(left:30,top:80),
//                 child: Text('Welcome \n  Back.!',style:
//                 TextStyle(
//                     color: Colors.white,fontSize: 34
//                 )),
//               ),
//               SingleChildScrollView(
//                 child: Container(
//                   padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.3,right:35,left:35),
//                   child: Column(
//                     children: [
//                       Container(
//                         padding: EdgeInsets.only(bottom:50),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//
//                           children: [
//                             Text('Login',style: TextStyle(
//                               fontSize: 30,
//                               color: Colors.white,
//                               fontWeight: FontWeight.w700,
//                             ),),],
//                         ),
//                       ),
//
//                       TextFormField(
//                         controller: _emailController,
//                         decoration: InputDecoration(
//                           hintText: 'Email',
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10)
//                           ),
//
//                         ),
//                       ),
//                       SizedBox(height: 30),
//                       TextFormField(
//                         controller: _passwordController,
//                         obscureText: true,
//                         decoration: InputDecoration(
//                           hintText: 'Password',
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 25),
//                       Container(
//                           height: 80,
//                           padding: EdgeInsets.all(20),
//                           child: ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               minimumSize:  Size.fromHeight(50),
//                             ),
//                             child: Text('Log in'),
//                             onPressed: signup,
//                           )),
//
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text('Dont have an account?'),
//                           TextButton(onPressed: (){
//                             Navigator.pushNamed(context, 'signup');
//                           }, child: Text('Sign up',style: TextStyle(
//                             decoration: TextDecoration.underline,
//                             fontSize: 16,
//                             fontWeight: FontWeight.w300,
//                           ),))
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         )
//     );
//   }
// }
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_core/firebase_core.dart';
import 'welcome_Screen.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(login());
}
class login extends StatefulWidget {
  @override
  State<login> createState() => _loginState();
}
class _loginState extends State<login> {
  final _messangerKey = GlobalKey<ScaffoldMessengerState>();
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void loginup() async {
    print( _emailController.text);
    print(_passwordController.text);
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text
      );
      Navigator.pushNamed(context,'welcome_Screen', arguments: [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1]);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('if');
        SnackBar snackbar = SnackBar(
          content:  Text("User not found!!!"),
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
      else if (e.code == 'wrong-password') {
        print('Else-If');
        SnackBar snackbar = SnackBar(
          content:  Text("Wrong password"),
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
      else{
        print('else');
        SnackBar snackbar = SnackBar(
          content:  Text("Some thing error occured"),
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

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: _messangerKey,
      home: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlXNt1FpZ8kYys78RUCXhyYpIHCq3HLuIJH8-MnxWkrUV-YmR5qC14-FMCpyOd1qk5934&usqp=CAU'),
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
                      NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlXNt1FpZ8kYys78RUCXhyYpIHCq3HLuIJH8-MnxWkrUV-YmR5qC14-FMCpyOd1qk5934&usqp=CAU"),
                          fit: BoxFit.cover)
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5,sigmaY: 5),
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
                    'SignIn',
                    style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold, color: Colors.black,fontFamily: 'Lora'),

                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: TextFormField(
                    controller: _emailController,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40.0),
                        borderSide: BorderSide(
                            color: Colors.black,
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
                          fontSize: 15,
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
                              color: Colors.black,
                              width: 2
                          )
                      ),
                      prefixIcon: Icon(
                        Icons.key,
                        color: Colors.blue,
                      ),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 15.5,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                  onPressed:(){
                    loginup();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
                  ),
                  child: Text(
                    '   Log In   ',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                  SizedBox(height: 20,),
                TextButton(onPressed: (){
                  Navigator.pushNamed(context, 'reset');
                }, child: Text('Forgot password',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.indigo[700],fontSize: 18),)),
                SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(onPressed: () {
                        login();
                        Navigator.pushNamed(context, 'signup');
                      } , child: Text(
                        "CreateAccount",
                        style: TextStyle(
                            fontSize: 17,color: Colors.black,fontWeight: FontWeight.bold),
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