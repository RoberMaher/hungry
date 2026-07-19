// main.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hungry/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}
