import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


/*class HelloUser extends StatelessWidget {
  const HelloUser({Key? key}) : super(key: key);

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
      height: 240,

      child:
          Stack(
            children: [
              Row(
                children: [
                  Stack(
                    alignment: Alignment(0,1.65),

                    children: <Widget>[

                      Container(width: MediaQuery.of(context).size.width * 0.5, height: 200,color: const Color(0xFF487eb0)),
                      smallContainer(const Color(0xFFf5f6fa), const Color(0xFF273c75), ["You Rolled This Week", "NULL", "times"])
                    ],
                  ),

                  Stack(
                    alignment: Alignment(0,1.65),

                    children: <Widget>[

                      Container(width: MediaQuery.of(context).size.width * 0.5, height: 200,color: const Color(0xFF40739e)),
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
                    SizedBox(height: 42),
                    Text("Hello Safak,", style: TextStyle(fontFamily: "RobotoMedium", color: const Color(0xFFecf0f1), fontSize: 25)),
                    Text("Welcome back!", style: TextStyle(fontFamily: "Roboto", color: const Color(0xFFecf0f1), fontSize: 22))

                  ],
                )
              ),
            ],
          )
    );

  }

} */

class HelloUser extends StatelessWidget {
  const HelloUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    Container statsContainer(textList) {
      return Container(
        decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: const Color(0xFFfdbc2f),
        boxShadow: [BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 1,
          blurRadius: 8,
          offset: Offset(0, 10),)],

      ),
        height: 100, width: MediaQuery.of(context).size.width * 0.5 - 30,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(textList[0], style: TextStyle(color: const Color(0xFF1c1a19), fontFamily: "Roboto") ),
              Text(textList[1],style: TextStyle(color: const Color(0xFF1c1a19), fontFamily: "Roboto", fontSize: 25)),
              Text(textList[2],style: TextStyle(color: const Color(0xFF1c1a19), fontFamily: "Roboto"))
            ],
          ),
        ),
      );
    }
    


    return Container(

      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(22), bottomRight: Radius.circular(22)),
        color: const Color(0xFF1c1a19),
      ),

      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Padding(

            padding: EdgeInsets.only(left: 25, top: 50, bottom: 30),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,


              children: [
                Text("Work'n Roll", style: TextStyle(fontFamily: "RobotoMedium", color: Colors.white, fontSize: 25)),
                //Text("Safak", style: TextStyle(fontFamily: "RobotoMedium", color: const Color(0xFF353b48), fontSize: 30))
              ],
            )

        ),




          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              statsContainer(["Your Rolled This Week", "#NULL", "times"]),
              SizedBox(width: 20),
              statsContainer(["Your Rolled This Week", "#NULL", "times"])
            ],
          ),

          SizedBox(height: 20)


        ],
      )





    );
  }
}

