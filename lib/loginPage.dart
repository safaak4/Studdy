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
            alignment: Alignment.center,
            children: [


              Align(
                alignment: Alignment.center,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(tag: "upperLogo", child: SvgPicture.asset( 'images/studdyLogoSVG.svg', color: const Color(0xFFFD794F), width: 115,)),
                    SizedBox(height: 50),
                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius:
                          BorderRadius.all(Radius.circular(90)),
                          boxShadow: [BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 0,
                            blurRadius: 6,
                            offset: Offset(0, 3),)],
                          color: Colors.white
                      ),

                      child:

                      TextField(
                        style: TextStyle(
                          color: const Color(0xFF1c1a19),
                          fontFamily: 'PoppinsLight',
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
                      width: 250,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius:
                          BorderRadius.all(Radius.circular(90)),
                          boxShadow: [BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 0,
                            blurRadius: 6,
                            offset: Offset(0, 3),)],
                          color: Colors.white
                      ),

                      child:

                      TextField(
                        style: TextStyle(
                          color: const Color(0xFF1c1a19),
                          fontFamily: 'PoppinsLight',
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
                              onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage())); },

                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF3F8A89)),
                                shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),

                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(90),
                                        side: BorderSide(color: Colors.white))),
                              ),
                              child: Text("SIGN IN", style: TextStyle(color: const Color(0xFFFFFFFF), fontFamily: "PoppinsMedium"),),
                            )
                        )
                    )),
                    
                    SizedBox(height: 0),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("New to Studdy?", style: TextStyle(fontFamily: "PoppinsLight", fontSize: 14, color: const Color(0xff3f8a89))),
                        TextButton(onPressed: null, child: Text("SIGN UP",
                            style: TextStyle(fontFamily: "PoppinsSemiBold", fontSize: 14, color: const Color(0xfffd794f))))



                      ],
                      
                    )


                  ],
                ),

              ),




      ]
          )
    );
  }
}
