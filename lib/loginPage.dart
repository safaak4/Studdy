import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studdy/fluttericonsfilled.dart';


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

  Stack backDesign = Stack(
    children: [OverflowBox(
        maxHeight: 400, maxWidth: 400,

        child: Align(
            alignment: Alignment(-18,0),

            child: RotationTransition(
                turns: new AlwaysStoppedAnimation(45 / 360),

                child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: const Color(0xFFfdbc2f)
                    ),
                    width: 380, height: 380

                )

            )
        )
    ),

      OverflowBox(
          maxHeight: 400, maxWidth: 400,

          child: Align(
              alignment: Alignment(-1.8,0),

              child: RotationTransition(
                  turns: new AlwaysStoppedAnimation(45 / 360),

                  child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.white
                      ),
                      width: 200, height: 200

                  )

              )
          )
      )

    ],

  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(


        children: <Widget>[
          backDesign,
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
                          color: Colors.white,
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
                        color: Colors.white,
                        fontFamily: 'Roboto',
                      ),

                      decoration: InputDecoration(
                        border: InputBorder.none,
                        //contentPadding: EdgeInsets.only(top: 14),


                        prefixIcon: Icon(
                          IconsPack.flickrlineal,
                          color: const Color(0xFF1c1a19),

                        ),
                        hintText: 'Password',
                      ),
                    ),
                  ),
                ],
              ),

            )
          )






        ],
      )
    );
  }
}
