import 'package:flutter/material.dart';
import 'welcome_Screen.dart';
import 'auto api.dart';

class Listvalues extends StatefulWidget {
  late Map<String , dynamic> df;
  Listvalues(Map<String , dynamic> di){
    df = di;
  }
  @override
  State<Listvalues> createState() => _ListvaluesState(df);
}

class _ListvaluesState extends State<Listvalues> {
  late List<num> potables = [];
  late Map<String , dynamic> ftg;
  _ListvaluesState(Map<String , dynamic> df){
    ftg = df;
  }
  late List<num> send = [];
  final _navKey = GlobalKey<NavigatorState>();
  List<bool> visible = [];
  List<String> params = ["Hardness", "Solids", "Chloramines", "Sulfate", "Conductivity", "Organic_carbon", "Trihalomethanes", "Turbidity"];
  List<Widget> gettiles(var lop, var index){
    List<Widget> ans = [];
    for(int i =1; i<=8; i++){
      var ti = params[i-1];
      var act = lop[i+1];
      var hj = Visibility(
        visible: visible[index],
        child: ListTile(
          contentPadding: EdgeInsets.all(7),
          title: Text("$ti: $act", style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 15.0,
          ),),
          tileColor: Colors.blue[100],
        ),
      );
      ans.add(hj);
    }
    return ans;
  }

  List<Widget> fun(){
    var fg = ftg;
    List output_list = [];
    if(fg['output']["0"]!=null)
    {
      for (int i = 0; i < fg['output'].length; i++) {
        var l = (fg['output'][i.toString()]);
        output_list.add(l);
      }
    }
    else{
      List<num> ad = [];
      for (var i in fg['output'].values){
        ad.add(i);
      }
      output_list.add(ad);
    }
    List<Widget> output_cards = [];
    for(int i=0; i<output_list.length; i++){
      visible.add(false);
      potables.add(output_list[i][10]);
      var xg = output_list[i][1];
      var tile = Container(
        margin: EdgeInsets.only(top: 2.0),
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.all(7),
              onTap: (){
                setState(() {
                  if(visible[i]==true){
                    visible[i] = false;
                  }
                  else{
                    visible[i] = true;
                  }
                });
              },
              onLongPress: (){
                for(var i in output_list[i]){
                  send.add(i);
                }
                send.add(potables[i]);
                _navKey.currentState?.pushNamed('/para', arguments: send);
              },
              title: Text("PH : $xg", style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15.0,
              ),),
              tileColor: Colors.blue[200],
            ),
            for (var i in gettiles(output_list[i], output_list.indexOf(output_list[i]))) i,
          ],
        ),
      );
      output_cards.add(tile);
    }
    return output_cards;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/para': (context) => inputpage(send),
      },
      navigatorKey: _navKey,
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text("Water Quality"),
            backgroundColor: Colors.black,
          ),
          body: ListView(
            children: fun(),
          ),
        ),
      ),
    );
  }
}