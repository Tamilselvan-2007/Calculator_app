import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  double size = 0;
  String input = "";
  String calcval = "";
  String operator = "";

  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size.width/5.5;
    
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('My Calc',style: TextStyle(color: Colors.white),),
          backgroundColor: const Color.fromARGB(255, 98, 94, 94),

        ),
        body : Column(
          children:[
            Column(
              children: [
                Container(
                  alignment: Alignment.bottomRight,
                  height: MediaQuery.of(context).size.height/5.8,
                  child: Text(input, style: TextStyle(color: Colors.white, fontSize: 50,),),
                ),
                Row(
                  children: [
                    calc_btn('7', Colors.grey),
                    calc_btn('8', Colors.grey),
                    calc_btn('9', Colors.grey),
                    calc_btn('/', Colors.orange),
                  ],
                ),
                  Row(
                  children: [
                    calc_btn('4', Colors.grey),
                    calc_btn('5', Colors.grey),
                    calc_btn('6', Colors.grey),
                    calc_btn('*', Colors.orange),
                  ],
                ),
                  Row(
                  children: [
                    calc_btn('1', Colors.grey),
                    calc_btn('2', Colors.grey),
                    calc_btn('3', Colors.grey),
                    calc_btn('-', Colors.orange),
                  ],
                ),
                  Row(
                  children: [
                    calc_btn('0', Colors.grey),
                    calc_btn('.', Colors.grey),
                    calc_btn('=', Colors.orange),
                    calc_btn('+', Colors.orange),
                  ], 
                ),
                calc_btn('AC', Colors.red),    
               ],
              )
            ],
          )
        ),
      );
     }

      Widget calc_btn(String text, Color bg) {
        return InkWell(
          onTap: () {
            setState(() {
              if (text == 'AC') {
                input = "";
                calcval = "";
                operator = "";
              } 
              else if (text == '+' || text == '-' || text == '*' || text == '/' ) {
                calcval = input;
                operator = text;
                input = "";
              }
              else if (text == '=') {
                setState(() {
                  if (operator == '+') {
                    input = (double.parse(calcval) + double.parse(input)).toString();
                  } else if (operator == '-') {
                    input = (double.parse(calcval) - double.parse(input)).toString();
                  } else if (operator == '*') {
                    input = (double.parse(calcval) * double.parse(input)).toString();
                  } else if (operator == '/') {
                    input = (double.parse(calcval) / double.parse(input)).toString();
                  }
                });
              }
              else {
                input += text;
              }
            });
          },
          child: Container(
                decoration: BoxDecoration(
                  color: bg,
                  borderRadius: BorderRadius.circular(100),
                ),
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.all(20),
                height:size,
                width:size,
                alignment: Alignment.center,
                child: Text(text,style: TextStyle(color: Colors.white,fontSize: 30,),),
                    ),
        );
      }
}
