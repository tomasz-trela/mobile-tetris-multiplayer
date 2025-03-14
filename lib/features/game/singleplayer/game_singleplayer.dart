import 'package:flutter/material.dart';
import 'package:mobile_tetris_multiplayer/features/game/singleplayer/buissnes/singleplayer_notifier.dart';
import 'package:mobile_tetris_multiplayer/features/game/singleplayer/views/game_singleplayer_view.dart';
import 'package:provider/provider.dart';

class GameSingleplayerPage extends StatelessWidget {
  const GameSingleplayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SingleplayerNotifier(),
      child: GameSingleplayerView()
    );
  }
}