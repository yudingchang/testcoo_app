import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  String buttonName;
  final VoidCallback onTap;

  double height;
  double width;
  double bottomMargin;
  double borderWidth;
  double leftMargin;
  Color buttonColor;
  Color borderColor;

  TextStyle textStyle;

  //passing props in react style
  RoundedButton({
    this.buttonName,
    this.onTap,
    this.height,
    this.bottomMargin,
    this.leftMargin = 0.0,
    this.borderWidth,
    this.width,
    this.buttonColor,
    this.textStyle = const TextStyle(
        color: const Color(0XFFFFFFFF),
        fontSize: 17.0,
        fontWeight: FontWeight.normal
    ),
    this.borderColor = const Color.fromRGBO(221, 221, 221, 1.0),
  });

  @override
  Widget build(BuildContext context) {
    if (borderWidth != 0.0)
      return (new InkWell(
        onTap: onTap,
        child: new Container(
          width: width,
          height: height,
          margin: new EdgeInsets.only(bottom: bottomMargin, left: leftMargin),
          alignment: FractionalOffset.center,
          decoration: new BoxDecoration(
              color: buttonColor,
              borderRadius: new BorderRadius.all(const Radius.circular(25.0)),
              border: new Border.all(
                  color: borderColor,
                  width: borderWidth)),
          child: new Text(buttonName, style: textStyle),
        ),
      ));
    else
      return (new InkWell(
        onTap: onTap,
        child: new Container(
          width: width,
          height: height,
          margin: new EdgeInsets.only(bottom: bottomMargin),
          alignment: FractionalOffset.center,
          decoration: new BoxDecoration(
            color: buttonColor,
            borderRadius: new BorderRadius.all(const Radius.circular(25.0)),
            gradient: const LinearGradient(colors: [Colors.lightBlue, Colors.greenAccent,Colors.purple]),
          ),
          child: new Text(buttonName, style: textStyle),
        ),
      ));
  }
}
