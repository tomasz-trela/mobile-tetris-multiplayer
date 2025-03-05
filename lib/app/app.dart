import 'package:flutter/material.dart';
import 'package:mobile_tetris_multiplayer/app/router.dart';
import 'package:mobile_tetris_multiplayer/app/theme/theming.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme();
    return MaterialApp.router(
      themeMode: ThemeMode.dark,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routerConfig: router,
      darkTheme: theme.dark,
    );
  }
}
