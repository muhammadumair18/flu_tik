import 'package:flu_tik/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
class Home extends StatefulWidget {



  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int pageindex=2;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: pages[pageindex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white12,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white30,
        currentIndex: pageindex,
        onTap: (value){
          setState(() {
            pageindex=value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.add),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.message),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Home'),
        ],
      ),
    );
  }
}
