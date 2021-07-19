import 'dart:async';
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
  _WorkTimeStatefulState createState() => _WorkTimeStatefulState(targetWorkMinute: this.targetWorkMinute);
}

class _WorkTimeStatefulState extends State<WorkTimeStateful> {
  //final double targetWorkMinute;
  double targetWorkMinute;
  _WorkTimeStatefulState({required this.targetWorkMinute});

  late double _counterMinute = (targetWorkMinute.toInt()*5).toDouble();
  double _counterSeconds = 0;
  late Timer _timer;
  late Timer _timerSeconds;

  @override
  void initState(){
    //_counter = (widget.targetWorkMinute).toInt()*5;


    if (_counterMinute == (targetWorkMinute.toInt()*5).toDouble()){
      _timer = Timer.periodic(Duration(minutes: 1), (timer) {
      if(mounted) setState(() {
        if(_counterMinute > 0){
          print(_counterMinute.toString());
          _counterMinute = _counterMinute - 0.5;
        }else{
          timer.cancel();
        }
      });
    });
    }//Timer Minutes

    if (_counterSeconds == 0){
      _timerSeconds = Timer.periodic(Duration(seconds: 1), (timer) {
        if (mounted) setState(() {
          if (_counterSeconds < 60){
            if (_counterSeconds == 5){

            }
            _counterSeconds = _counterSeconds + 0.5;

          }else{

          }
        });
      });
    }
  }

  SizedBox buttonFunction(){
    if (_counterSeconds < 5){
      return SizedBox(


        width: 200,
        child: OutlinedButton(onPressed: () {
          if (_timer != null)
          {_timer.cancel();}
          Navigator.pop(context); },
            child: Text("Discard " + (5 - _counterSeconds.toInt()).toString(), style: TextStyle(color: Colors.white, fontSize: 15)),
            style: OutlinedButton.styleFrom(side: BorderSide(width: 1))),
      );
    }else{
      return SizedBox();
    }
  }


  Future<bool> _onBackPressed() async {

    if (_counterSeconds >5){

    return (await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        backgroundColor: const Color(0xFFfdbc2f),
        title: new Text('Are you sure?', style: TextStyle(color: const Color(0xff1c1a19), fontFamily: "Roboto")),
        content: new Text('if you quit it will remain a failure', style: TextStyle(color: const Color(0xff1c1a19), fontFamily: "Roboto")),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No', style: TextStyle(color: const Color(0xff1c1a19), fontFamily: "Roboto")),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: new Text('Yes', style: TextStyle(color: const Color(0xff1c1a19), fontFamily: "Roboto")),
          ),
        ],
      ),
    )) ?? false; }else{
      return true;
    }


  }

  @override
  Widget build(BuildContext context) {

    initState();

    return WillPopScope(onWillPop: _onBackPressed, child: Scaffold(
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
                        Hero(tag: "newWorkWidget", child: StartNewWork(1, widget.targetWorkMinute, _counterMinute/5)),
                        Text(_counterMinute.toInt().toString(), style: TextStyle(fontFamily: "Roboto", color: Colors.white, fontSize: 30)),
                      ]

                  ),
                  buttonFunction()
                ],
              ),

            )
        )
    )
    );
  }
}


