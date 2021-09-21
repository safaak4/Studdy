import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';


class StartNewWork extends StatelessWidget {
  //const StartNewWork({Key? key}) : super(key: key);

  const StartNewWork();


  @override
  Widget build(BuildContext context) {

    return startnewworkstateful();
  }

}

class startnewworkstateful extends StatefulWidget {
  const startnewworkstateful({Key? key}) : super(key: key);

  @override
  _startnewworkstatefulState createState() => _startnewworkstatefulState();
}

class _startnewworkstatefulState extends State<startnewworkstateful> {


  @override
  Widget build(BuildContext context) {
    int _currentIntValue =10;

    return Container(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            SizedBox(height: 25),

            StatefulBuilder(
              builder: (context4, setState2) {
                return NumberPicker(
                      textStyle: TextStyle(fontSize: 25, color: const Color(
                          0x9A4E4E4E)),
                      selectedTextStyle: TextStyle(fontSize: 35),
                      value: _currentIntValue,
                      minValue: 0,
                      step: 5,
                      maxValue: 120,
                      itemWidth: 85,
                      haptics: true,
                      axis: Axis.horizontal,
                      onChanged: (value) => setState2(() => _currentIntValue = value),
                    );


              },
            ),

            SizedBox(height: 20),

            Hero(tag: "loginButtonHero", child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius:
                    BorderRadius.all(Radius.circular(90)),
                    boxShadow: [BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 0,
                      blurRadius: 6,
                      offset: Offset(0, 4),)],
                    color: const Color(0xFF3F8A89)
                ),

                child: SizedBox(
                    width: 350, height: 50,
                    child: ElevatedButton(
                      onPressed: () { },

                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF3F8A89)),
                        shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),

                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(90),
                                side: BorderSide(color: Colors.white))),
                      ),
                      child: Text("Roll it", style: TextStyle(color: const Color(0xFFFFFFFF), fontFamily: "PoppinsLight"),),
                    )
                )
            ))


          ],
        )


    );
  }
}


