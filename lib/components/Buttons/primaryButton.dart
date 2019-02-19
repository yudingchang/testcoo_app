import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  String buttonName;
  final VoidCallback onTap;

  double height;
  double width;
  double bottomMargin;
  double borderWidth;
  Color buttonColor;

  TextStyle textStyle = const TextStyle(
      color: const Color(0XFFFFFFFF),
      fontSize: 17.0,
      fontWeight: FontWeight.normal
  );

  //passing props in react style
  PrimaryButton({
    this.buttonName,
    this.onTap,
    this.height,
    this.bottomMargin,
    this.borderWidth,
    this.width,
    this.buttonColor
  });

  @override
  Widget build(BuildContext context) {
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
          gradient: const LinearGradient(colors: [
            const Color(0XFFFFBE00), const Color(0XFFFF9801)
          ]),
        ),
        child: new Text(buttonName, style: textStyle),
      ),
    ));
  }
}
