import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class StartNewWork extends StatelessWidget {
  const StartNewWork({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String percentageModifier(double value) {
      final roundedValue = (value.toInt() * 5).ceil().toInt().toString();
      return '$roundedValue';
    }

    final slider = SleekCircularSlider(

        appearance: CircularSliderAppearance(
          angleRange: 360,
          size: 170,

          customColors: CustomSliderColors(
          progressBarColor: const Color(0xFFf5f6fa),
          dotColor: const Color(0xFF273c75)
          ),

          infoProperties: InfoProperties(
            modifier: percentageModifier,
            mainLabelStyle: TextStyle(
              color: const Color(0xFFECF0F1),
              fontSize: 30,
              fontFamily: 'Roboto'
          )    
          )

        ),
        onChange: (double value) {
          print(value);
        },
        max: 25, min: 1,
        initialValue: 5,
    );

    final startButton = ElevatedButton(
      onPressed: () {  },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF40739e)),
      ),
      child: Text("Roll It!", style: TextStyle(fontFamily: "Roboto", color: const Color(0xFFECF0F1), fontSize: 17)),
    );

    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          //color: Colors.whi,
          borderRadius: BorderRadius.all(Radius.circular(30)),
          boxShadow: [BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 4),)],
          gradient: new LinearGradient(
              begin: Alignment.bottomCenter,
              end: AlignmentDirectional.topCenter,
              colors: [
                const Color(0xFF00a8ff),
                const Color(0xFF0097e6),
              ])
      ),
      width: 270,
      height: 270,
      margin: EdgeInsets.all(25),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          slider,
          SizedBox(height: 15),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,

           children: <Widget>[
             SizedBox(
               width: 200,
               height: 40,
               child: startButton
             )

           ],
         )

        ],
      )


    );
  }

}

