

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
          width: double.infinity,
          height: 300,
          alignment: Alignment.topCenter,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: double.infinity,
                  child: Image.network("https://firebasestorage.googleapis.com/v0/b/studdy-34.appspot.com/o/Defaults%2Fdefaultcover.jpg?alt=media&token=816eefe9-fa78-4fe2-9e4d-2106616e0220"),
                ),
              ),

              Positioned(
                left: 20,
                top: 90,
                child: Container(
                      width: 92,
                      height: 92,
                      child: ClipOval(child: Image.network(
"https://firebasestorage.googleapis.com/v0/b/studdy-34.appspot.com/o/Defaults%2Fdefaultprofilepic.jpg?alt=media&token=e567864b-716f-4f34-9f46-f2150518d969")),
                    ),
              ),

              Positioned(
                left: 130,
                  top: 132,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Cuma Şafak Kara", style: TextStyle(color: const Color(0xFF131313), fontFamily: "PoppinsMedium",
                          fontSize: 18)),

                      SizedBox(height: 0),

                      Text("@bensafaak", style: TextStyle(color: const Color(0xFF131313), fontFamily: "PoppinsLight",
                          fontSize: 13)),

                    ],
                  )
              )




            ],
          )


        )


      )

    );
  }
}
