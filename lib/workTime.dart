import 'package:flutter/material.dart';
import './startNewWork.dart';


class WorkTime extends StatelessWidget {
  //const WorkTime({Key? key}) : super(key: key);
  final double targetWorkMinute;
  const WorkTime(this.targetWorkMinute);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:
      SizedBox(
        width: double.infinity,
        child:
        Padding(
          padding: EdgeInsets.all(0),

          child: Stack(
            alignment: Alignment(0, 0.47),
            children: <Widget>[
              Hero(tag: "newWorkWidget", child: StartNewWork(1, targetWorkMinute)),
              SizedBox(
                width: 100,
                child: OutlinedButton(onPressed: () {Navigator.pop(context);},child: Text("Discard", style: TextStyle(color: Colors.white)),
                    style: OutlinedButton.styleFrom(side: BorderSide(width: 1))),
              )
            ],
          )
        )
      )
    );
  }


}

