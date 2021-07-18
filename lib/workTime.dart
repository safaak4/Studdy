import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './startNewWork.dart';


class WorkTime extends StatelessWidget {
  const WorkTime({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    return MaterialApp();
  }

}


class WorkTimeStateful extends StatefulWidget {
  final double targetWorkMinute;
  const WorkTimeStateful(this.targetWorkMinute);


  //const WorkTimeStateful({Key? key}) : super(key: key);

  @override
  _WorkTimeStatefulState createState() => _WorkTimeStatefulState();
}

class _WorkTimeStatefulState extends State<WorkTimeStateful> {
  //final double targetWorkMinute;
  int _counter = 50;
  late Timer _timer;

  @override
  void initState(){
    //_counter = (widget.targetWorkMinute).toInt()*5;
    _timer = Timer.periodic(Duration(minutes: 1), (Timer timer) {
      if(mounted) setState(() {
        if(_counter > 0){
          print(_counter.toString());
          _counter = _counter - 1;
        }else{
          timer.cancel();
        }
      });
    });
  }


  @override
  Widget build(BuildContext context) {


    initState();


    return Scaffold(
        body:
        SizedBox(
            width: double.infinity,
            child:
            Padding(
                padding: EdgeInsets.all(0),

                child: Stack(
                      alignment: Alignment(0,0.5),
                      children: <Widget>[
                        Stack(
                            alignment : Alignment.center,
                          children: <Widget>[
                            Hero(tag: "newWorkWidget", child: StartNewWork(1, widget.targetWorkMinute)),
                            Text("$_counter", style: TextStyle(fontFamily: "Roboto", color: Colors.white, fontSize: 20)),
                           ]

                        ),
                        SizedBox(

                          width: 100,
                          child: OutlinedButton(onPressed: () {
                            if (_timer != null)
                            {_timer.cancel();}

                            Navigator.pop(context); },
                              child: Text("Discard", style: TextStyle(color: Colors.white)),
                              style: OutlinedButton.styleFrom(side: BorderSide(width: 1))),
                        )
                      ],
                    ),

            )
        )
    );
  }
}


