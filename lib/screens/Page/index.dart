import "package:flutter/material.dart";
import 'package:testcoo_inspector/theme/style.dart';
import 'package:testcoo_inspector/screens/Page/home.dart';
import 'package:testcoo_inspector/screens/Page/my.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({ Key key }) : super(key: key);

  @override
  AppScreenState createState() => new AppScreenState();
}

class AppScreenState extends State<AppScreen>{
  int _currentIndex = 0;
  final List<Widget> _children = [
    new HomeScreen(),
    new Container(
      color: Colors.red
    ),
    new Container(
      color: Colors.green
    ),
    new MyScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Color(0XFFF5F5F5),
      appBar: AppBar(
        title: Text('首页', style: largeStyle),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.3,
        actions: [
          new IconButton( // action button
            icon: new Icon(Icons.message, color: Color(0XFF333333)),
            onPressed: () {
            },
          ),
        ]
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('首页'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.access_time),
            title: new Text('我的订单'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.mail),
            title: new Text('抢单'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('我的')
          )
        ],
      ),
    );
  }
}