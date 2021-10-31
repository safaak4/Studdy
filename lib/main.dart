import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studdy/fluttericonsfilled.dart';
import 'package:studdy/profilepage.dart';
import 'package:studdy/rankamongfriends.dart';
import './startNewWork.dart';
import './helloUserWidget.dart';
import './whatDidYouDoThisWeek.dart';





class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Studdy',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );

  }
}

class MyHomePage extends StatefulWidget {
  //MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  //final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int pageindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color(0xFF001D3D),
      /*appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 100,
        title: Column(
          children: <Widget>[
            Text("Hello Safak,", style: TextStyle(color: Colors.black87, fontFamily: "Roboto")),
            SizedBox(height: 10),
            Text("Welcome Back", style: TextStyle(color: Colors.black87, fontSize: 25, fontFamily: "Roboto"))
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),*/
      body: (pageindex==0)?SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            HelloUser(),
            StartNewWork(),
            SizedBox(height: 10),
            rankamongfriends(),
            SizedBox(height: 10),
            WhatDidYouDoThisWeek()
          ],
        ),
      ) :(pageindex == 1) ?Container(width: double.infinity,
          child: Text("1"))

      :Container(width: double.infinity,
          child: profilepage()),


      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: const Color(0xffffffff),
        items: [
          BottomNavigationBarItem(icon: new Icon(IconsPack.homefilled, color:  const Color(0xFF131313)), label: ""),
          BottomNavigationBarItem(icon: new Icon(IconsPack.friendsfilled, color: const Color(0xFF131313)), label: ""),
          BottomNavigationBarItem(icon: new Icon(IconsPack.userfilled, color:  const Color(0xFF131313)), label: ""),


        ],
        onTap: (index) {
          setState(() {
            pageindex = index;
          });
        }
      ),
    );
  }


}
