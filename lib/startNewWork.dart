import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:worknroll/workTime.dart';


class StartNewWork extends StatelessWidget {
  //const StartNewWork({Key? key}) : super(key: key);
  final int pageIndex;
  final double targetWorkTime;
  final double counterNew;
  const StartNewWork(this.pageIndex, this.targetWorkTime, this.counterNew);


  @override
  Widget build(BuildContext context) {



    String percentageModifier(double value) {
      if(pageIndex ==0){
        final roundedValue = (value.toInt() * 5).ceil().toString();
        return '$roundedValue';
      }else{
        return "";
      }

    }

      double slideValue = 5;

     final slider = SleekCircularSlider(

        appearance: CircularSliderAppearance(
          angleRange: 360,
          startAngle: 270,
          size: pageIndex==0 ?185 :230,

          customWidths: CustomSliderWidths(progressBarWidth: 12),

          customColors: CustomSliderColors(
          progressBarColor: const Color(0xFFFFFFFF),
          dotColor: const Color(0xFF1c1a19)
          ),

          infoProperties: InfoProperties(
            modifier: percentageModifier,
            mainLabelStyle: TextStyle(
              color: const Color(0xFFFFFFFF),
              fontSize: pageIndex==0 ?40 :50,
              fontFamily: 'Roboto'  )
          )
        ),

        onChange:
        (pageIndex == 0)  ?(double value) {slideValue = value;} :null,

        max: 25, min: 1,

        initialValue:
        (pageIndex == 0)
            ? 5
            : counterNew//targetWorkTime

    );

    final startButton = ElevatedButton(
      onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => WorkTimeStateful(slideValue))); },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFfdbc2f)),
      ),
      child: Text("Roll It!", style: TextStyle(fontFamily: "Roboto", color: const Color(0xFF1c1a19), fontSize: 17)),
    );


    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: pageIndex==0
          ?BorderRadius.all(Radius.circular(30)) :null,
          boxShadow: [BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 4),)],
          color: const Color(0xFF1c1a19)
          /*gradient: new LinearGradient(
              begin: Alignment.bottomCenter,
              end: AlignmentDirectional.topCenter,
              colors: [
                const Color(0xFF0097e6),
                const Color(0xFF00a8ff),
              ])*/
      ),

      width: pageIndex == 0
      ? 380 : MediaQuery.of(context).size.width,

      height: pageIndex==0
        ?285 :MediaQuery.of(context).size.height,

      margin: pageIndex==0
        ?EdgeInsets.all(25) :null,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          slider,
          SizedBox(height: 15 ),

             if (pageIndex == 0) SizedBox(
               width: 200,
               height: 40,
               child: startButton
             )


           ],
      )
    );
  }

}

