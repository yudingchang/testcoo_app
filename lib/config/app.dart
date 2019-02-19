import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class AppConfig extends InheritedWidget {
  AppConfig({
    @required Widget child,
  }) : super(child: child);

  String appName = 'TESTCOO DEV';
  String flavorName = 'development';
  String apiBaseUrl = 'https://192.168.8.182';

  static AppConfig of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(AppConfig);
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
