import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:studdy/fluttericonsfilled.dart';
import 'package:studdy/main.dart';

void main() {
  runApp(loginpage());
}


class loginpage extends StatelessWidget {
  const loginpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return MaterialApp(home: loginpagestateful());
  }
}

class loginpagestateful extends StatefulWidget {
  const loginpagestateful({Key? key}) : super(key: key);

  @override
  _loginpagestatefulstate createState() => _loginpagestatefulstate();
}

class _loginpagestatefulstate extends State<loginpagestateful> {



  double sizeback = 365;
  double sizefront = 210;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,

        body: Stack(
            alignment: Alignment.centerLeft,

            children: <Widget>[
            Stack(
                 children: [AnimatedPositioned(
                   duration: Duration(seconds: 1),
                   left: -190, top: MediaQuery.of(context).size.height/5,
                   height: 100, width: 100,

                   child: OverflowBox(
                     maxHeight: 400, maxWidth: 400,

                     child: RotationTransition(
                         turns: new AlwaysStoppedAnimation(45 / 360),

                         child: AnimatedContainer(
                             duration: Duration(seconds: 2),
                             decoration: BoxDecoration(
                                 shape: BoxShape.rectangle,
                                 color: const Color(0xFFfdbc2f)
                             ),
                             //width: 380, height: 380

                         )

                     )

                 ),),



                OverflowBox(
                    maxHeight: 400, maxWidth: 400,

                    child: Align(
                        alignment: Alignment.bottomRight,

                        child: RotationTransition(
                            turns: new AlwaysStoppedAnimation(45 / 360),

                            child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: Colors.white
                                ),
                                width: 230, height: 230

                            )

                        )
                    )
                )

                ],),


              Align(
                  alignment: Alignment(0,-0.6),
                  child: Hero(tag: "upperLogo", child: SvgPicture.asset(
                    'images/studdyLogoSVG.svg', color: const Color(0xFFfdbc2f), width: 115,
                  ))
              ),

              Align(
                  alignment: Alignment.center,
                  child: Container(
                    color:  Colors.transparent,
                    width: 280, height: 280,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius:
                              BorderRadius.all(Radius.circular(90)),
                              boxShadow: [BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 0,
                                blurRadius: 8,
                                offset: Offset(0, 4),)],
                              color: Colors.white
                          ),

                          child:

                          TextField(
                            style: TextStyle(
                              color: const Color(0xFF1c1a19),
                              fontFamily: 'Roboto',
                            ),

                            decoration: InputDecoration(
                              border: InputBorder.none,
                              //contentPadding: EdgeInsets.only(top: 14),

                              prefixIcon: Icon(
                                IconsPack.userlineal,
                                color: const Color(0xFF1c1a19),

                              ),
                              hintText: 'Username',
                            ),
                          ),
                        ),

                        SizedBox(height: 25),

                        Container(
                          alignment: Alignment.center,
                          height: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius:
                              BorderRadius.all(Radius.circular(90)),
                              boxShadow: [BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 0,
                                blurRadius: 8,
                                offset: Offset(0, 4),)],
                              color: Colors.white
                          ),

                          child:

                          TextField(
                            style: TextStyle(
                              color: const Color(0xFF1c1a19),
                              fontFamily: 'Roboto',
                            ),

                            decoration: InputDecoration(
                              border: InputBorder.none,
                              //contentPadding: EdgeInsets.only(top: 14),


                              prefixIcon: Icon(
                                IconsPack.lock,
                                color: const Color(0xFF1c1a19),

                              ),
                              hintText: 'Password',
                            ),
                          ),
                        ),

                        SizedBox(height: 45),

                        Container(
                            alignment: Alignment.center,
                            height: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius:
                                BorderRadius.all(Radius.circular(90)),
                                boxShadow: [BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 0,
                                  blurRadius: 8,
                                  offset: Offset(0, 4),)],
                                color: Colors.white
                            ),

                          child: SizedBox(
                              width: 350, height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    //sizedeneme = 370;
                                  });

                                  //Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
                                  },

                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                  shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),

                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(90),
                                          side: BorderSide(color: Colors.white))),
                                ),
                                child: Text("Login", style: TextStyle(color: const Color(0xFF1c1a19)),),
                              )
                          )
                        )


                      ],
                    ),
                  )
              )
            ],
          )
    );
  }
}
