import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_tetris_multiplayer/app/router.dart';
import 'package:mobile_tetris_multiplayer/app/theme/theming.dart';
import 'package:mobile_tetris_multiplayer/features/game/singleplayer/buissnes/singleplayer_notifier.dart';
import 'package:mobile_tetris_multiplayer/gen/assets.gen.dart';
import 'package:provider/provider.dart';

class SingleplayerGameOver extends StatelessWidget {
  const SingleplayerGameOver({
    super.key,
    required this.score,
  });

  final int score;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              spacing: AppPadding.smallPaddingValue,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(Assets.images.gameOverBanner, width: size.width * 0.7,),
                SvgPicture.asset(
                  Assets.images.medal,
                  width: size.width * 0.3,
                ),
                Text(
                  "Your Score: ",
                  style: textTheme.displayMedium,
                ),
                Text(
                  score.toString(),
                  style: textTheme.displayMedium!.copyWith(
                      fontWeight: FontWeight.w600
                    ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: AppPadding.hugePaddingValue * 2),
            child: Center(
              child: Column(
                spacing: AppPadding.mediumPaddingValue,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FilledButton(
                    onPressed: context.read<SingleplayerNotifier>().restartGame,
                    style: FilledButton.styleFrom(
                      backgroundColor:ColorsConsts.green,
                      padding: EdgeInsets.symmetric(horizontal: AppPadding.bigPaddingValue, vertical: AppPadding.tinyPaddingValue)
                    ), 
                    child: Text(
                      "New game",
                      style: textTheme.headlineLarge!.copyWith(
                        fontWeight: FontWeight.w700,
                        color: ColorsConsts.blackBlue
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: router.goHome,
                    child: SizedBox(
                      child: Text(
                        "Back to menu",
                        style: textTheme.headlineSmall
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}