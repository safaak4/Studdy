

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:studdy/loginPage.dart';

void main(){
  runApp(getstarted());
}

class getstarted extends StatelessWidget {
  const getstarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: getstartedstateful());  }
}

class getstartedstateful extends StatefulWidget {
  const getstartedstateful({Key? key}) : super(key: key);

  @override
  _getstartedstatefulState createState() => _getstartedstatefulState();
}

class _getstartedstatefulState extends State<getstartedstateful> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Hero(
              tag: "illustrationtag",
              child: Image.asset('images/getstartedillustration.png', width: 280,)),
          SizedBox(height: 35),
          

          Column(

              children: [
                Text("Welcome to the", style: TextStyle(color: const Color(0xFF131313), fontFamily: "PoppinsThin", fontSize: 14,
                    decoration: TextDecoration.none)),
                SizedBox(height: 5),
                Hero(tag: "upperLogo", child: SvgPicture.asset(
                  'images/studdyLogoSVG.svg', color: const Color(0xFFFD794F), width: 170,
                ))


              ],
            ),


          SizedBox(height: 25),
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
                    onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => loginpagestateful())); },

                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF3F8A89)),
                      shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),

                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(90),
                              side: BorderSide(color: Colors.white))),
                    ),
                    child: Text("Get started", style: TextStyle(color: const Color(0xFFFFFFFF), fontFamily: "PoppinsMedium"),),
                  )
              )
          ))

        ],


      ),


    );
  }
}
