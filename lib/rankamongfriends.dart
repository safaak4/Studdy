

import 'package:flutter/material.dart';

class rankamongfriends extends StatelessWidget {
  const rankamongfriends({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class rangamongfriendsstful extends StatefulWidget {
  const rangamongfriendsstful({Key? key}) : super(key: key);

  @override
  _rangamongfriendsstfulState createState() => _rangamongfriendsstfulState();
}

class _rangamongfriendsstfulState extends State<rangamongfriendsstful> {
  @override
  Widget build(BuildContext context) {
    return Container(

      width: double.infinity,

        child: Column(
            mainAxisSize: MainAxisSize.min,

            children: <Widget>[
        Padding(padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
        child: Row(

          children: [

            Text("Score Table", style: TextStyle(color: const Color(0xFF131313), fontFamily: "PoppinsSemiBold",
                fontSize: 18)),
            Spacer(),
            TextButton(onPressed: null, child: Text("See All"))
          ],
        )
    )
    ]
    )









    );
  }
}

