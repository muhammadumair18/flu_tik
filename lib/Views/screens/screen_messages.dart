import 'package:flutter/material.dart';
class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: Center(
      child: Text('Messages',style: TextStyle(color: Colors.white,fontSize: 15),),
    ),);
  }
}
