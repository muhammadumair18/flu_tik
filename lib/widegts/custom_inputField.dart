import 'package:flutter/material.dart';

class CustomInputField extends StatefulWidget {
  TextEditingController controller;
  bool ispasswordfield;
  String hinttxt;
  IconData? icon;

  @override
  _CustomInputFieldState createState() => _CustomInputFieldState();

  CustomInputField({
    required this.controller,
    required this.ispasswordfield,
    required this.hinttxt,
    required this.icon,
  });
}

class _CustomInputFieldState extends State<CustomInputField> {

  late bool _ishidden;

  @override
  void initState() {
    _ishidden = widget.ispasswordfield;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      controller: widget.controller,
      obscureText: _ishidden,
      decoration: InputDecoration(
        prefixIcon: Icon(widget.icon, color: Colors.green,),
        suffixIcon: widget.ispasswordfield ?
        IconButton(onPressed: () {
          if(widget.ispasswordfield){
            setState(() {
              _ishidden = !_ishidden;
            });
          }
        },
            icon: Visibility(
              visible: widget.ispasswordfield,
              child: Icon(widget.ispasswordfield?(_ishidden ? Icons.visibility:Icons.visibility_off):null,color: Colors.white,),
            )): null,
        labelText: widget.hinttxt,
        labelStyle: TextStyle(color: Colors.white),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: Colors.white,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: Colors.orangeAccent,
            )),
      ),
    );
  }
}
