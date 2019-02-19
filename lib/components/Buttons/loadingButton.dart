import 'package:flutter/material.dart';

class LoadingButton extends StatefulWidget {
  double height;
  double width;
  double bottomMargin;
  double borderWidth;
  Color buttonColor;

  LoadingButton({
    this.height,
    this.bottomMargin,
    this.borderWidth,
    this.width,
    this.buttonColor
  });

  @override
  _LoadingButtonState createState() => new _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  TextStyle textStyle = const TextStyle(
      color: const Color(0XFFFFFFFF),
      fontSize: 17.0,
      fontWeight: FontWeight.normal
  );

  @override
  Widget build(BuildContext context) {
    return (new InkWell(
      child: new Container(
        width: widget.width,
        height: widget.height,
        margin: new EdgeInsets.only(bottom: widget.bottomMargin),
        alignment: FractionalOffset.center,
        decoration: new BoxDecoration(
          color: widget.buttonColor,
          borderRadius: new BorderRadius.all(const Radius.circular(25.0)),
          gradient: const LinearGradient(colors: [
            const Color(0XFFFFBE00), const Color(0XFFFF9801)
          ]),
        ),
        child: new SizedBox(
          child: new CircularProgressIndicator(
              strokeWidth: 2.0,
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.white)
          ),
          height: 24.0,
          width: 24.0,
        ),
      ),
    ));
  }
}
