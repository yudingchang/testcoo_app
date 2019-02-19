import 'package:flutter/material.dart';
import 'package:testcoo_inspector/services/validations.dart';
import 'package:testcoo_inspector/theme/style.dart';
import 'package:flutter/material.dart';

class Password extends StatelessWidget {
  double bottomMargin;
  var onSaved;
  Key key;
  Validations validations = new Validations();

  //passing props in the Constructor.
  //Java like style
  Password(
      {
      this.bottomMargin,
      this.onSaved});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (new Container(
      margin: new EdgeInsets.only(bottom: bottomMargin),
      child: new Container(
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            new Expanded(
              child: new TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: SizedBox(
                      child: Center(
                        widthFactor: 0.0,
                        child: Text('密码', style: textStyle),
                      ),
                    ),
                  ),

                  style: textStyle,
                  key: key,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  validator: validations.validatePassword,
                  onSaved: onSaved
              ),
            )
          ]
          )
      )
    ));
  }
}
