import 'package:flutter/material.dart';
import 'package:mobile_tetris_multiplayer/features/game/singleplayer/buissnes/singleplayer_notifier.dart';
import 'package:mobile_tetris_multiplayer/features/game/widgets/game_result_widget.dart';
import 'package:provider/provider.dart';

class SingleplayerScoreSection extends StatelessWidget {
  const SingleplayerScoreSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final game = context.watch<SingleplayerNotifier>();
    
    return SizedBox(
      width: double.infinity,
      child: Row(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: GameResultWidget(
              color: colorScheme.tertiary, 
              title: "Score", 
              result: game.score.toString(),
            ),
          ),
          Expanded(
            child: GameResultWidget(
              color: colorScheme.primaryContainer, 
              title: "Lines", 
              result: game.lines.toString()
            ),
          ),
          Expanded(
            child: GameResultWidget(
              color: colorScheme.onErrorContainer, 
              title: "Level", 
              result: game.level.toString()
            ),
          )
        ],
      ),
    );
  }
}