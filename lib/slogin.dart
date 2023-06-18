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
//         decoration: BoxDecoration(
//           image: DecorationImage(
//               image: AssetImage('assets/d5898ae37df930cfa3909f41cdc60786.jpg'
//               ),
//               fit: BoxFit.cover),),
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