
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'friends.dart';

class rankamongfriends extends StatelessWidget {
  const rankamongfriends({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return rankamongfriendsstful();
  }
}

class rankamongfriendsstful extends StatefulWidget {
  const rankamongfriendsstful({Key? key}) : super(key: key);

  @override
  _rankamongfriendsstfulState createState() => _rankamongfriendsstfulState();
}

class _rankamongfriendsstfulState extends State<rankamongfriendsstful> {



  @override
  Widget build(BuildContext context) {

    Map friendsmap = {"Jessica Durdan": 100, "Angela Love": 80, "Kirk Hammet": 50};

    var sortedfriendsmap = friendsmap.keys.toList(growable:false)
      ..sort((k2, k1) => friendsmap[k1].compareTo(friendsmap[k2]));
    LinkedHashMap sortedMap = new LinkedHashMap
        .fromIterable(sortedfriendsmap, key: (k) => k, value: (k) => friendsmap[k]);

    return Container(
        //height: 100,
        width: double.infinity,

        child: Column(
          //mainAxisSize: MainAxisSize.min,

            children: <Widget>[
              Padding(padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                  child: Row(

                    children: [

                      Text("Score Table", style: TextStyle(color: const Color(0xFF131313), fontFamily: "PoppinsSemiBold",
                          fontSize: 18)),
                      Spacer(),
                      TextButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => friendslist())); },
                          child: Text("See All"))
                    ],



                  )
              ),

              Container(

                child: MediaQuery.removePadding(context: context,
                    removeTop: true,
                    child: ListView.builder(

                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: friendsmap.length,
                    itemBuilder: (BuildContext context, int index) => Padding(padding: EdgeInsets.all(7),
                      child: Container(

                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: Colors.white,

                          boxShadow: [BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 6,
                            offset: Offset(0, 8),)],

                        ),


                        width: 100,
                        height: 70,
                        child: Row(
                          children: [

                            SizedBox(width: 10),

                            Container(
                              alignment: Alignment.centerLeft,
                              child: Image.asset("images/personpictures/person" + (index+1).toString() + ".png", width: 55,height: 55),

                            ),


                            SizedBox(width: 20),



                            Text(sortedMap.keys.elementAt(index).toString(), style:
                                    TextStyle(fontFamily: "PoppinsLight", color: const Color(0xFF353b48))),

                            Spacer(),

                            Align(
                                  alignment: Alignment.centerRight,
                                  child:  Text(sortedMap.values.elementAt(index).toString(), style:
                                  TextStyle(fontFamily: "PoppinsLight", color: const Color(0xFF353b48))),
                            ),





                            SizedBox(width: 25)
                          ],
                        ),
                      ),)
                )),
              )

            ]
        )
    );
  }
}
