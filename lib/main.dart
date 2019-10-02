import 'package:flutter/material.dart';
import 'package:flutter_quito/di/dependency_injection.dart';
import 'package:flutter_quito/myapp.dart';

void main() {
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  Injector.configure(Flavor.MOCK);
  runApp(MyApp());
}
