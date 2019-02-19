import 'package:flutter/material.dart';
import 'package:testcoo_inspector/screens/Login/index.dart';
import 'package:testcoo_inspector/screens/SignUp/index.dart';
import 'package:testcoo_inspector/screens/Page/index.dart';
import 'package:testcoo_inspector/theme/style.dart';
import 'package:testcoo_inspector/app_state_container.dart';

class Routes extends StatelessWidget {

  var routes = <String, WidgetBuilder>{
    "/SignUp": (BuildContext context) => new SignUpScreen(),
    "/HomePage": (BuildContext context) => new AppScreen()
  };

  @override
  Widget build(BuildContext context) {
    // Call AppConfig.of(context) anywhere to obtain the
    // environment specific configuration
    var config = AppStateContainer.of(context);

    return new MaterialApp(
      title: config.appName,
      home: new LoginScreen(),
      theme: appTheme,
      routes: routes,
    );
  }
}