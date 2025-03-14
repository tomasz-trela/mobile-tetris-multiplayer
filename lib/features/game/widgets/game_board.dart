import 'package:flutter/material.dart';
import 'package:mobile_tetris_multiplayer/features/game/models/game.dart';
import 'package:mobile_tetris_multiplayer/features/game/widgets/game_block.dart';

class GameBoard extends StatelessWidget {
  const GameBoard({super.key, required this.board});

  final Board board;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    const spacing = 1.5;
    final flatList = board.expand((list) => list).toList();

    return SizedBox(
      width: size.width * 0.62,
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 10,
        mainAxisSpacing: spacing,
        crossAxisSpacing: spacing,
        children: List.generate(
          200, 
          (index) => GameBlock(colorType: flatList[index])
        ),
      ),
    );
  }
}