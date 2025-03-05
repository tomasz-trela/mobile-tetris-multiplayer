import 'package:flutter/material.dart';
import 'package:mobile_tetris_multiplayer/app/theme/theming.dart';
import 'package:mobile_tetris_multiplayer/common/widgets/app_bar/base_app_bar.dart';
import 'package:mobile_tetris_multiplayer/features/game/widgets/game_board.dart';
import 'package:mobile_tetris_multiplayer/features/game/widgets/game_result_widget.dart';

class GameSingleplayerView extends StatelessWidget {
  const GameSingleplayerView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: BaseAppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.pause), 
            onPressed: () {},
          ),
        ]
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.hugePaddingValue),
        child: Column(
          spacing: AppPadding.mediumPaddingValue,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: GameResultWidget(
                      color: colorScheme.tertiary, 
                      title: "Score", 
                      result: "1000",
                    ),
                  ),
                  Expanded(
                    child: GameResultWidget(
                      color: colorScheme.primaryContainer, 
                      title: "Lines", 
                      result: "1"
                    ),
                  ),
                  Expanded(
                    child: GameResultWidget(
                      color: colorScheme.onErrorContainer, 
                      title: "Level", 
                      result: "2"
                    ),
                  )
                ],
              ),
            ),
            GameBoard(),
          ]
        ),
      ),
    );
  }
}