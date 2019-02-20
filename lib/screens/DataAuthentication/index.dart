import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:testcoo_inspector/theme/style.dart';
//import 'package:testcoo_inspector/components/TextFields/inputField.dart';
//import 'package:testcoo_inspector/components/Buttons/textButton.dart';
//import 'package:testcoo_inspector/components/Buttons/roundedButton.dart';
//import 'package:testcoo_inspector/services/validations.dart';


class DataAuthentication extends StatefulWidget {
  const DataAuthentication({Key key}) : super(key: key);

  @override
  DataAuthenticationState createState() => new DataAuthenticationState();
}

class DataAuthenticationState extends State<DataAuthentication> {
  BuildContext context;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    double _width = MediaQuery.of(context).size.width;
    return Container(
        child: new Column(
          children: [
            new Container(
              width: _width,
              padding:  new EdgeInsets.symmetric(horizontal: 12.0, vertical: 50.0),
              color: ,
            ),
          ]
        )
    );
  }
}
