

import 'package:flutter/material.dart';

class profilepage extends StatelessWidget {
  const profilepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return profileapgestful();
  }
}

class profileapgestful extends StatefulWidget {
  const profileapgestful({Key? key}) : super(key: key);

  @override
  _profileapgestfulState createState() => _profileapgestfulState();
}

class _profileapgestfulState extends State<profileapgestful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Container(

          child: Positioned(
            left: 10,
            top: 50  ,
            child: Text("My Profile", style: TextStyle(color: Colors.black, fontFamily: "PoppinsSemiBold", fontSize: 18)),



          )




        )


      )

    );
  }
}
