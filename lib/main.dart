import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_tetris_multiplayer/app/app.dart';

void main() {
  runApp(const App());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}
