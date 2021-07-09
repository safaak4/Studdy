import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WhatDidYouDoThisWeek extends StatelessWidget {
  const WhatDidYouDoThisWeek({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    List<String> denemeList = ["Math", "Physics", "Chemistry", "Biology", "Art"];


    return Container(
      width: double.infinity,

      child: Column(
        mainAxisSize: MainAxisSize.min,

        children: <Widget>[
          Padding(padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
            child: Row(

              children: [

                Text("What Did You Do This Week", style: TextStyle(color: const Color(0xFF353b48), fontFamily: "RobotoMedium", fontSize: 19)),
                Spacer(),
                TextButton(onPressed: null, child: Text("See All"))
              ],
            )
          ),


          SizedBox(
            height: 114.0,
            child: ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: denemeList.length,
              itemBuilder: (BuildContext context, int index) => Padding(padding: EdgeInsets.all(7),
                child: Container(

                  decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: const Color(0xFFfbc531),

                  boxShadow: [BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 8,
                  offset: Offset(0, 10),)],

                  ),


                width: 100,
                height: 100,
                child: Center(child: Text(denemeList[index], style: TextStyle(fontFamily: "Roboto", color: const Color(0xFF353b48)))),
             ),)
            ),
          ),





        ],
      ),
    );
  }




}