
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatefulWidget {
  Color? color;
  String text;
  double? width;
  double? height;
  EdgeInsetsGeometry? margin;
  VoidCallback onPressed;

  CustomButton(
      {this.color,
      required this.text,
      required this.onPressed,
      this.width,
      this.margin,
      this.height});

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        margin:
            widget.margin ?? EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        height: widget.height ?? 7.h,
        width: widget.width ?? MediaQuery.of(context).size.width,
        child: ElevatedButton(
          onPressed: widget.onPressed,
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(10),
              primary: widget.color ?? Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              )),
          child: Text(
            widget.text,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white,fontSize: 18.sp),
          ),
        ),
      ),
    );
  }
}
