import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_tetris_multiplayer/app/theme/theming.dart';
import 'package:mobile_tetris_multiplayer/common/widgets/app_bar/base_app_bar.dart';
import 'package:mobile_tetris_multiplayer/features/game/models/direction.dart';
import 'package:mobile_tetris_multiplayer/features/game/singleplayer/buissnes/singleplayer_notifier.dart';
import 'package:mobile_tetris_multiplayer/features/game/singleplayer/views/singleplayer_game_over.dart';
import 'package:mobile_tetris_multiplayer/features/game/singleplayer/widgets/singleplayer_score_section.dart';
import 'package:mobile_tetris_multiplayer/features/game/widgets/game_board.dart';
import 'package:mobile_tetris_multiplayer/features/game/widgets/upcoming_section.dart';
import 'package:mobile_tetris_multiplayer/gen/assets.gen.dart';
import 'package:provider/provider.dart';

class GameSingleplayerView extends StatefulWidget {
  const GameSingleplayerView({super.key});

  @override
  State<GameSingleplayerView> createState() => _GameSingleplayerViewState();
}

class _GameSingleplayerViewState extends State<GameSingleplayerView> {
  void onTapDown(TapDownDetails details, Size size, SingleplayerNotifier notifier){
    if(details.globalPosition.dy < size.height*0.4){
      return notifier.rotate();
    }
    if(details.globalPosition.dy > size.height*0.8){
      return notifier.moveShape(Direction.down);
    }
    if(details.globalPosition.dx < size.width/2){
      return notifier.moveShape(Direction.left);    
    }
    return notifier.moveShape(Direction.right);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final notifier = context.read<SingleplayerNotifier>();
      notifier.startGame();
    });
  }

  @override
  Widget build(BuildContext context) {
    final game = context.watch<SingleplayerNotifier>();
    final notifier = context.read<SingleplayerNotifier>();
    final size = MediaQuery.sizeOf(context);

    if(game.isOver) return SingleplayerGameOver(score: game.score,);
    
    return Stack(
      children: [
        GestureDetector(
          onLongPressStart: (details) => game.onLongPressStart(),
          onLongPressEnd: (details) => game.onLongPressEnd(),
          onTapDown: (details) => onTapDown(details, size, notifier),
          child: Scaffold(
            appBar: BaseAppBar(
              actions: [
                IconButton(
                  icon: Icon(Icons.pause), 
                  onPressed: notifier.pauseUnpauseGame,
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
        ),
        if(!game.isRunning)
        Positioned.fill(
          child: Container(
            color: Colors.black.withAlpha(0xAC),
            child: Center( 
              child: GestureDetector(
                onTap: notifier.pauseUnpauseGame,
                child: SizedBox.square(
                  dimension: size.width * 0.1,
                  child: SvgPicture.asset(Assets.icons.play),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

