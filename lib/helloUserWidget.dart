import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class helloUser extends StatelessWidget {
  const helloUser({Key? key}) : super(key: key);

  Widget smallContainer(containerColorr, textColorr, textList){
    
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: containerColorr,

        boxShadow: [BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 1,
          blurRadius: 8,
          offset: Offset(0, 10),)],

      ),
      height: 95, width: 135,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(textList[0], style: TextStyle(color: textColorr, fontFamily: "Roboto") ),
            Text(textList[1],style: TextStyle(color: textColorr, fontFamily: "Roboto", fontSize: 25)),
            Text(textList[2],style: TextStyle(color: textColorr, fontFamily: "Roboto"))
          ],
        ),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    
    return Container(
      width: double.infinity,
      height: 250,

      child:
          Stack(
            children: [
              Row(
                children: [
                  Stack(
                    alignment: Alignment(0,1.65),

                    children: <Widget>[

                      Container(width: MediaQuery.of(context).size.width * 0.5, height: 220,color: const Color(0xFF487eb0)),
                      smallContainer(const Color(0xFFf5f6fa), const Color(0xFF273c75), ["You Rolled This Week", "NULL", "times"])
                    ],
                  ),

                  Stack(
                    alignment: Alignment(0,1.65),

                    children: <Widget>[

                      Container(width: MediaQuery.of(context).size.width * 0.5, height: 220,color: const Color(0xFF40739e)),
                      smallContainer(const Color(0xFF273c75), const Color(0xFFf5f6fa), ["Your Rank is", "# NULL", ""])
                    ],
                  ),
                ],
              ),

              Padding(
                padding: EdgeInsets.all(22.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 60),
                    Text("Hello Safak,", style: TextStyle(fontFamily: "RobotoMedium", color: const Color(0xFFecf0f1), fontSize: 25)),
                    Text("Welcome back!", style: TextStyle(fontFamily: "Roboto", color: const Color(0xFFecf0f1), fontSize: 22))

                  ],
                )
              ),
            ],
          )
    );

  }

}
