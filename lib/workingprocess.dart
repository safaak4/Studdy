import 'dart:async';

import 'package:flutter/material.dart';



class workingprocess extends StatelessWidget {
  final int selectedtime;
  const workingprocess({Key? key, required this.selectedtime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return workingprocessstful(selectedtime: selectedtime);
  }
}

class workingprocessstful extends StatefulWidget {
  final int selectedtime;

  const workingprocessstful({Key? key, required this.selectedtime}) : super(key: key);

  @override
  _workingprocessstfulState createState() => _workingprocessstfulState(selectedtimee: selectedtime);
}

class _workingprocessstfulState extends State<workingprocessstful> {

   int selectedtimee;
    _workingprocessstfulState({required this.selectedtimee});


  List<Color> colorList = [
    Color(0xff207567),
    Color(0xFF358873),
    Color(0xff4e9c81),
    Color(0xff6baf92),

    Color(0xff3dc3a7),

    Color(0xff6baf92),
    Color(0xff4e9c81),
    Color(0xFF358873),



    /*Colors.greenAccent,
    Colors.amberAccent,
    Color(0xFFFD794F),
    Colors.cyanAccent*/
  ];
  List<Alignment> alignmentList = [
    Alignment.bottomLeft,
    Alignment.bottomRight,
    Alignment.topRight,
    Alignment.topLeft,
  ];
  int index = 0;
  Color bottomColor = Color(0xff227668);
  Color topColor = Color(0xFF358671);
  Alignment begin = Alignment.bottomLeft;
  Alignment end = Alignment.topRight;

  late Timer _timer;
  int timezonevar = 59;
  int fivesecondsrule = 0;


   @override
   void initState() {
      selectedtimee = selectedtimee -1;

      _timer = Timer.periodic(Duration(seconds: 1), (timer) {

        if (timezonevar > 0){
          print(timezonevar.toString());
          timezonevar = timezonevar - 1;
          fivesecondsrule = fivesecondsrule + 1;


        }else{
          if (selectedtimee!=0){
            selectedtimee = selectedtimee -1;
            timezonevar = 59;
          }else{
           _timer.cancel();
          }
        }


      });


      super.initState();
  }


   /*static int start = 5;

   Timer _timer = new Timer.periodic(
     Duration(seconds: 1),
         (Timer timer) {
       if (start == 0) {
         setState(() {
           selectedtimee = selectedtimee -1;
           start = 60;
         });
       } else {
         setState(() {
           start--;
         });
       }
     },
   );*/


   Future<bool> _onBackPressed() async {

     if (fivesecondsrule >5){

       return (await showDialog(
         context: context,
         builder: (context) => new AlertDialog(
           backgroundColor: const Color(0xffffffff),
           title: new Text('Are you sure?', style: TextStyle(color: const Color(0xFF3F8A89), fontFamily: "Roboto")),
           content: new Text('if you quit it will remain a failure', style: TextStyle(color: const Color(0xFF3F8A89), fontFamily: "Roboto")),
           actions: <Widget>[
             TextButton(
               onPressed: () => Navigator.of(context).pop(false),
               child: new Text('No', style: TextStyle(color: const Color(0xFFFD794F), fontFamily: "Roboto")),
             ),
             TextButton(
               onPressed: () {Navigator.of(context).pop(true);
               _timer.cancel();
               },
               child: new Text('Yes', style: TextStyle(color: const Color(0xFFFD794F), fontFamily: "Roboto")),
             ),
           ],
         ),
       )) ?? false; }else{
       _timer.cancel();
       return true;
     }


   }

  @override
  Widget build(BuildContext context) {



    Future.delayed(const Duration(milliseconds: 10), () {
      setState(() {
        //bottomColor = Color(0xFF358671);
        bottomColor = colorList[index % colorList.length];
        //index = index +1;

      });
    });

    return WillPopScope(
      onWillPop: _onBackPressed,

      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [

            AnimatedContainer(
              duration: Duration(milliseconds: 800),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: begin, end: end, colors: [bottomColor, topColor])),

              onEnd: () {
                setState(() {
                  index = index + 1;
                  // animate the color
                  bottomColor = colorList[index % colorList.length];
                  topColor = colorList[(index+1) % colorList.length];



                  //// animate the alignment
                  // begin = alignmentList[index % alignmentList.length];
                  // end = alignmentList[(index + 2) % alignmentList.length];
                });
              },

            ),

            Align(
                alignment: Alignment.center,

                child:
                    Text(selectedtimee.toString() + ":" + ((timezonevar<10)?"0":"") +timezonevar.toString(),
                        style: TextStyle(color: Colors.white, fontFamily: "UniSansBold", fontSize: 105)   ),



            ),
          ],
        )

      ),
    );




  }
}

