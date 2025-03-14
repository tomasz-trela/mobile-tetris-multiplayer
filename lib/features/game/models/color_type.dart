import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobile_tetris_multiplayer/app/theme/theming.dart';

enum ColorType {
  red,
  green,
  blue,
  yellow,
  orange,
  purple;

  factory ColorType.random() {
    final values = ColorType.values;
    return values[Random().nextInt(values.length)];
  }

  Color get dark => switch (this) {
    ColorType.red => ColorsConsts.red,
    ColorType.green => ColorsConsts.greenLight,
    ColorType.blue => ColorsConsts.tealDark,
    ColorType.yellow => ColorsConsts.yellow,
    ColorType.orange => ColorsConsts.orange,
    ColorType.purple => ColorsConsts.purple,
  };

  Color get light => switch (this) {
    ColorType.red => ColorsConsts.salmon,
    ColorType.green => ColorsConsts.green,
    ColorType.blue => ColorsConsts.teal,
    ColorType.yellow => ColorsConsts.yellowLight,
    ColorType.orange => ColorsConsts.orangeLight,
    ColorType.purple => ColorsConsts.purpleLight,
  };
}