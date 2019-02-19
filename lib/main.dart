import 'package:testcoo_inspector/routes.dart';
import 'package:testcoo_inspector/app_state_container.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new AppStateContainer(
    child: new Routes(),
  ));
}