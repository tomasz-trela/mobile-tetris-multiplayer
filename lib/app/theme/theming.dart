import 'package:flutter/material.dart';
import 'package:mobile_tetris_multiplayer/gen/fonts.gen.dart';

abstract class AppPadding {
  static const sidePaddingValue = 20.0;
  static const tinyPaddingValue = 8.0;
  static const smallPaddingValue = 16.0;
  static const mediumPaddingValue = 24.0;
  static const bigPaddingValue = 32.0;
  static const hugePaddingValue = 40.0;

  static const sideBasePadding = EdgeInsets.symmetric(horizontal: sidePaddingValue);
  static const tinySizedBoxHeigth = SizedBox(height: tinyPaddingValue,);

  static final smallBorderRaduis = BorderRadius.circular(3);
}

abstract class AppBorder {
  static const borderRaduisValue = 16.0;
  
  static final borderRaduis = BorderRadius.circular(borderRaduisValue);
}

abstract class AppThemeData {
  ThemeData get light;
  ThemeData get dark;
}

class AppTheme implements AppThemeData {
  const AppTheme();
  
  @override
  ThemeData get dark => ThemeData(
    brightness: Brightness.dark,
    colorScheme: _darkColorScheme,
    fontFamily: FontFamily.rajdhani,
    textTheme: _textTheme,
    filledButtonTheme: _darkFilledButtonTheme
  );
  
  @override
  ThemeData get light => throw UnimplementedError();

  static final _darkColorScheme = ColorScheme.dark(
    primary: ColorsConsts.teal, 
    primaryContainer: ColorsConsts.tealDark,
    secondary: ColorsConsts.purple,
    secondaryContainer: ColorsConsts.purpleLight,
    surface: ColorsConsts.blueDark,
    tertiary: ColorsConsts.yellow,
    onErrorContainer: ColorsConsts.red
  );

  FilledButtonThemeData get _darkFilledButtonTheme => FilledButtonThemeData(
    style: FilledButton.styleFrom(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: AppBorder.borderRaduis
      ),
      backgroundColor: ColorsConsts.red,
      textStyle: _textTheme.titleMedium,
      foregroundColor: ColorsConsts.mistyRose,
      alignment: Alignment.center,
      minimumSize: Size(80, 40),
    )
  );

  static final _textTheme = TextTheme(
    titleMedium: TextStyle(
      color: ColorsConsts.mistyRose,
      fontSize: 24,
      fontWeight: FontWeight.w700,
      fontFamily: FontFamily.rajdhani
    ),
    headlineMedium: TextStyle(
      color: ColorsConsts.blackBlue,
      fontSize: 20,
      fontWeight: FontWeight.w600,
      fontFamily: FontFamily.rajdhani
    ),
  );
}

abstract class ColorsConsts {
  static const purple = Color(0xFF936FAC);
  static const purpleLight = Color(0xFFA687BA);
  static const teal = Color(0xFF2DC3C0);
  static const tealDark = Color(0xFF0CB2AF);
  static const navyBlue = Color(0xFF293241);
  static const salmon = Color(0xFFEE7A6D);
  static const red = Color(0xFFE95E50);
  static const yellow = Color(0xFFFAC723);
  static const yellowLight = Color(0xFFFCD94F);
  static const orangeLight = Color(0xFFF5A53F);
  static const orange = Color(0xFFF29222);
  static const mistyRose = Color(0xFFFFF5EE);
  static const greenLight = Color(0xFFA1C65D);
  static const green = Color(0xFFB4D274);
  static const blueDark = Color(0xFF204A70);
  static const skyBlue = Color(0xFFDAE7F2);
  static const greyBlue = Color(0xFF4F7392);
  static const blackBlue = Color(0xFF293241);
}