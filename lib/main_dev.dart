import 'package:flutter/material.dart';
import 'package:flutter_advanced/app.dart';
import 'package:flutter_advanced/core/helpers/app_initializer.dart';

void main() async  {
  print("dev");
  await AppInitializer.initialize();
  runApp(const App());
}

