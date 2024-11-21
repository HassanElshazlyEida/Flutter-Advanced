import 'package:flutter/material.dart';
import 'package:flutter_advanced/app.dart';
import 'package:flutter_advanced/core/di/dependency_injection.dart';

void main() async  {
  await setupGetIt();
  runApp(const App());
}

