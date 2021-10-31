import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:flutter_svg/svg.dart';
import 'package:studdy/fluttericonsfilled.dart';

void main() {
  runApp(signuppage());
}


class signuppage extends StatelessWidget {
  const signuppage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return Scaffold(body: signuppagestateful());
   /* return Scaffold(
      body: FutureBuilder(
        // Initialize FlutterFire
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          // Check for errors
          if (snapshot.hasError) {
            //return SomethingWentWrong();
          }

          // Once complete, show your application
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(body: signuppagestateful());
          }

          // Otherwise, show something whilst waiting for initialization to complete
          return Text("sa");
        },
      ),
    );*/
  }
}

class signuppagestateful extends StatefulWidget {
  const signuppagestateful({Key? key}) : super(key: key);

  @override
  _signuppagestatefulstate createState() => _signuppagestatefulstate();
}

class _signuppagestatefulstate extends State<signuppagestateful> {







  double sizeback = 365;
  double sizefront = 210;
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final usernamecontroller = TextEditingController();

  signUpFunction() async {


    if(emailcontroller.text != "" && passwordcontroller.text != "" && passwordcontroller.text.length >= 6) {

      try{

        await FirebaseFirestore.instance.collection("Users").doc(usernamecontroller.text).get().then((doc) => {

                if (doc.exists == false){

                    FirebaseFirestore.instance.collection("Users").doc(usernamecontroller.text)
                      .set({"UserEmail": emailcontroller.text, "UserUsername": usernamecontroller.text,
                        "UserPassword": passwordcontroller.text}).then((user) {

                      FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: emailcontroller.text, password: passwordcontroller.text).then((user) => {

                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("You have successfully registered. Yes, successfully."),
                        )),

                        Navigator.pop(context)

                      });

                   })

                }else{

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                   content: Text("This email is already using."),
                    ))
                }


              });





      }

      on FirebaseAuthException catch (e) {
        switch (e.code){
          case "invalid-email":
            return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("It looks like you entered an invalid email address."),
            ));
            break;
          case "email-already-in-use":
            return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("This email address already associated with another account."),
            ));
            break;
        }
      }


    }else if(emailcontroller.text == "" || passwordcontroller.text == ""){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("You must fill out the form completely!"),
      ));
    }else if(passwordcontroller.text.length < 6){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Your password must not be less than 6 characters."),
      ));
    } else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("It seems that an error has occurred. Sometimes happen."),
      ));
    }


  }

  @override
  Widget build(BuildContext context) {




    return Scaffold(
        backgroundColor: Colors.white,

        //resizeToAvoidBottomInset: false,

        body: Center(
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),

            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Stack(

                  alignment: Alignment.center,
                  children: [


                    Align(
                      alignment: Alignment.center,

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Hero(tag: "upperLogo", child: SvgPicture.asset( 'images/studdyLogoSVG.svg', color: const Color(
                              0xFFFD794F), width: 115,)),
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
                              controller: emailcontroller,
                              style: TextStyle(
                                color: const Color(0xFF1c1a19),
                                fontFamily: 'PoppinsLight',
                              ),

                              decoration: InputDecoration(
                                border: InputBorder.none,
                                //contentPadding: EdgeInsets.only(top: 14),


                                prefixIcon: Icon(
                                  IconsPack.messagelineal,
                                  color: const Color(0xFF1c1a19),

                                ),
                                hintText: 'Email',
                              ),
                            ),
                          ), //email

                          SizedBox(height: 25),
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
                                    onPressed: signUpFunction,

                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF3F8A89)),
                                      shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),

                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(90),
                                              side: BorderSide(color: Colors.white))),
                                    ),
                                    child: Text("SIGN UP", style: TextStyle(color: const Color(0xFFFFFFFF), fontFamily: "PoppinsMedium"),),
                                  )
                              )
                          )),

                          SizedBox(height: 0),
                        ],
                      ),

                    ),




                  ]
              ),
            ),
          ),
        )
    );
  }
}



//EXAMPLE
/*class ApplicationState extends ChangeNotifier {
  ApplicationState() {
    init();
  }

  Future<void> init() async {
    await Firebase.initializeApp();

    FirebaseAuth.instance.userChanges().listen((user) {
      if (user != null) {
        _loginState = ApplicationLoginState.loggedIn;
      } else {
        _loginState = ApplicationLoginState.loggedOut;
      }
      notifyListeners();
    });
  }

  ApplicationLoginState _loginState = ApplicationLoginState.loggedOut;
  ApplicationLoginState get loginState => _loginState;

  String? _email;
  String? get email => _email;

  void startLoginFlow() {
    _loginState = ApplicationLoginState.emailAddress;
    notifyListeners();
  }

  void verifyEmail(
      String email,
      void Function(FirebaseAuthException e) errorCallback,
      ) async {
    try {
      var methods =
      await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
      if (methods.contains('password')) {
        _loginState = ApplicationLoginState.password;
      } else {
        _loginState = ApplicationLoginState.register;
      }
      _email = email;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  void signInWithEmailAndPassword(
      String email,
      String password,
      void Function(FirebaseAuthException e) errorCallback,
      ) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  void cancelRegistration() {
    _loginState = ApplicationLoginState.emailAddress;
    notifyListeners();
  }

  void registerAccount(String email, String displayName, String password,
      void Function(FirebaseAuthException e) errorCallback) async {
    try {
      var credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await credential.user!.updateProfile(displayName: displayName);
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
  }
}*/
