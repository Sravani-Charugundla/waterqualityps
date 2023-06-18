
import 'package:flutter/material.dart';
class Predict extends StatelessWidget {
  // const Predict({Key? key}) : super(key: key);
  Text w=Text(
  'WARNING',
  style: TextStyle(
  fontSize: 50,
  fontWeight: FontWeight.bold,
  fontFamily: 'Lora',
      color: Colors.red
  ),
  );
  Text r=Text(
    'SAFE',
    style: TextStyle(
        fontSize: 50,
        fontWeight: FontWeight.bold,
        fontFamily: 'Lora',
        color: Colors.green
    ),
  );
  Icon fg = Icon(Icons.close_rounded,size: 150,color: Colors.red,);
  Icon xg = Icon(Icons.check,size: 150,color: Colors.green,);
  Row d=Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      SizedBox(width: 20,),
      Container(
              width: 270,
              margin: EdgeInsets.all(10),
              child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image(
              image: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQzmx9io4PUNQVu4fEk198JDHEiXl9nzFc6Q&usqp=CAU'),
              ),
              ),
      ),
      SizedBox(width: 20,)
    ],
  );
  Row n= Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      SizedBox(width: 20,),
      Container(
        padding: EdgeInsets.all(20),
        child: Image(
          alignment: Alignment.center,
          height: 200,
          width: 270,
          image: NetworkImage(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqfzINZDlPHiM1uxuUDARb5m1P549_VWcYpQ&usqp=CAU'
          ),
        ),
      ),
      SizedBox(width: 20,)
    ],
  );
  String abcd;
  Predict({required this.abcd});
  late String bc;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('PREDICTION',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 22
          ),

        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0.0,
        actions: [

        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlueAccent, Colors.white],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        child: Center(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              this.abcd=="not suitable for drinking"?fg:xg,
              Text(
                this.abcd=="not suitable for drinking"?"":"",
                ),
                this.abcd=="not suitable for drinking"? w:r,
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Icon(Icons.water_drop_outlined,color: Colors.blue,size: 35,),
                  Text(
                    abcd,
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lora',
                        color: Colors.black
                    ),
                  ),

                ],

              ),
              Row(
                children: [
                  this.abcd=="not suitable for drinking"? n:d,
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}