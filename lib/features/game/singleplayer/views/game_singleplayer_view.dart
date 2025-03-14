import 'package:flutter/material.dart';
import 'package:mobile_tetris_multiplayer/app/theme/theming.dart';
import 'package:mobile_tetris_multiplayer/common/widgets/app_bar/base_app_bar.dart';
import 'package:mobile_tetris_multiplayer/features/game/models/direction.dart';
import 'package:mobile_tetris_multiplayer/features/game/singleplayer/buissnes/singleplayer_notifier.dart';
import 'package:mobile_tetris_multiplayer/features/game/singleplayer/widgets/singleplayer_score_section.dart';
import 'package:mobile_tetris_multiplayer/features/game/widgets/game_board.dart';
import 'package:mobile_tetris_multiplayer/features/game/widgets/upcoming_section.dart';
import 'package:provider/provider.dart';

class GameSingleplayerView extends StatelessWidget {
  const GameSingleplayerView({super.key});

  void onTapDown(TapDownDetails details, Size size, SingleplayerNotifier notifier){
    if(details.globalPosition.dy < size.height*0.4){
      return;
      //return rotate
    }
    if(details.globalPosition.dy > size.height*0.8){
      return notifier.move(Direction.down);
    }
    if(details.globalPosition.dx < size.width/2){
      return notifier.move(Direction.left);    
    }
    return notifier.move(Direction.right);
  }

  @override
  Widget build(BuildContext context) {
    final game = context.watch<SingleplayerNotifier>().game;
    final notifier = context.read<SingleplayerNotifier>();
    final size = MediaQuery.sizeOf(context);
    
    return GestureDetector(
      onTapDown: (details) => onTapDown(details, size, notifier),
      child: Scaffold(
        appBar: BaseAppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.pause), 
              onPressed: notifier.startGame,
            ),
          ]
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.hugePaddingValue),
          child: Column(
            spacing: AppPadding.mediumPaddingValue,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SingleplayerScoreSection(),
              UpcomingSection(shapes: game.upcomingShapes.toList().sublist(1),),
              GameBoard(board: game.board,),
            ]
          ),
        ),
      ),
    );
  }
}

