import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HelloUser extends StatelessWidget {
  const HelloUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Container(



      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          SizedBox(height: 50),
          Hero(tag: "upperLogo", child: SvgPicture.asset(
                  'images/studdyLogoSVG.svg', color: const Color(0xFFFD794F), width: 115,
                )



        ),

        ],
      )


    );
  }
}

