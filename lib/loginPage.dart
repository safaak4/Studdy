import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:studdy/fluttericonsfilled.dart';
import 'package:studdy/main.dart';
import 'package:studdy/signuppage.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';


void main() {
  runApp(loginpage());
}


class loginpage extends StatelessWidget {
  const loginpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();


    return Scaffold(body: loginpagestateful());
  }
}

class loginpagestateful extends StatefulWidget {
  const loginpagestateful({Key? key}) : super(key: key);

  @override
  _loginpagestatefulstate createState() => _loginpagestatefulstate();
}

class _loginpagestatefulstate extends State<loginpagestateful> {


  logincheck() async {

    try {
      var userdoc = await FirebaseFirestore.instance.collection("Users").doc(usernamecontroller.text).get();
      var userpswrd = userdoc.data()!["UserPassword"];

       if(passwordcontroller.text == userpswrd){
         var usermail = userdoc.data()!["UserEmail"];



         await FirebaseAuth.instance.signInWithEmailAndPassword(
             email: usermail,
             password: passwordcontroller.text
         ).then((value) => {

             Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()))



         });


       }else{
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
           content: Text("Username or password is wrong. But I am not sure which one is wrong."),
         ));

       }

    } catch (e){

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("It seems we encountered an unexpected error. Could you please report this to my developer? Error: "
        + e.toString()),
      ));

    }



    /*try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: "barry.allen@example.com",
          password: "SuperSecretPassword!"
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }*/



    /*var targetdoc =  await FirebaseFirestore.instance.collection("Users").doc(usernamecontroller.text).get();

    if (targetdoc == null){

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Have you tried to sign-up? Because I can't find this user."),
      ));

    }else if (passwordcontroller.text == targetdoc.data()!["UserPassword"]){
      Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));

    }else if (passwordcontroller.text != targetdoc.data()!["UserPassword"]){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Username or password is wrong. But I am not sure which one is wrong."),
      ));

    }else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("It seems we encountered an unexpected error. Could you please report this to my developer?"),
      ));

    }*/

  }


  final passwordcontroller = TextEditingController();
  final usernamecontroller = TextEditingController();

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
                    Hero(tag: "usernamehero", child: Material(
                      type: MaterialType.transparency,
                      child: Container(
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
                          controller: usernamecontroller,
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
                      )
                    )),

                    SizedBox(height: 25),

                    Hero(tag: "passwordhero", child: Material(
                      type: MaterialType.transparency,
                      child:   Container(
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
                          controller: passwordcontroller,
                          obscureText: true,
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
                      )
                    )),

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
                              onPressed: logincheck,

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
                        TextButton(onPressed: () {


                          Navigator.push(context, MaterialPageRoute(builder: (context) => signuppage()));


                          },
                            child: Text("SIGN UP",
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
