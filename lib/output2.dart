// import 'package:flutter/material.dart';
// class output extends StatelessWidget {
//   // const output({Key? key}) : super(key: key);
//   String va;
//   Icon fg = Icon(Icons.block_outlined,size: 150,color: Colors.red,);
//   Icon xg = Icon(Icons.check_circle,size: 150,color: Colors.green,);
//   output({required this.va});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "output"
//         ),
//       ),
//       body: Container(
//         child: Center(
//           child: Text(
//           ),
//
//         ),
//       ),
//     );
//   }
// }
import 'dart:ui';

import 'package:flutter/material.dart';
class Predict2 extends StatelessWidget {
  // const Predict({Key? key}) : super(key: key);
  Icon fg = Icon(Icons.block_outlined,size: 150,color: Colors.red,);
  // Icon xg = Icon(Icons.check_circle,size: 150,color: Colors.green,);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            fg,
            Text(
              "WARNING",
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lora',
                  color: Colors.red

              ),
            ),
            SizedBox(height: 20,),
            Text(
              'UNSAFE',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Lora'
              ),
            ),
          ],
        ),
      ),
    );
  }
}