import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_tetris_multiplayer/app/router.dart';
import 'package:mobile_tetris_multiplayer/app/theme/theming.dart';
import 'package:mobile_tetris_multiplayer/gen/assets.gen.dart';

class MenuSelectionButtons extends StatelessWidget {
  const MenuSelectionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.sizeOf(context);

    void showComingSoonDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            backgroundColor: ColorsConsts.greyBlue,
            title: Text(
              "Coming Soon!",
              textAlign: TextAlign.center,
              style: textTheme.headlineLarge!.copyWith(
                fontWeight: FontWeight.w600
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(Assets.images.hourglass),
                SizedBox(height: 10),
                Text(
                  "This feature is not available yet, but we're working on it!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          );
        },
      );
    }

    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        IntrinsicWidth(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    _MenuButtonSmall(
                      text: "Singleplayer", 
                      iconCount: 1, 
                      onPressed: router.goSingleplayerPage,
                      backgroundColor: colorScheme.secondary,
                    ),
                    SizedBox(height: AppPadding.mediumPaddingValue,),
                    _MenuButtonSmall(
                      text: "Multiplayer", 
                      iconCount: 1, 
                      onPressed: () => showComingSoonDialog(context),
                      backgroundColor: colorScheme.primaryContainer,
                    ),
                  ],
                ),
              ),
              SizedBox(width: AppPadding.mediumPaddingValue,),
              Expanded(
                child: SizedBox(
                  height: size.height * 0.26,
                  child: FilledButton(
                    onPressed: () => showComingSoonDialog(context), 
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("You"),
                        AppPadding.tinySizedBoxHeigth,
                        SvgPicture.asset(Assets.images.swords),
                        AppPadding.tinySizedBoxHeigth,
                        Text("Friend"),
                      ],
                    )
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: AppPadding.mediumPaddingValue,),
        FilledButton(
          style: FilledButton.styleFrom(
            backgroundColor: colorScheme.tertiary,
            padding: EdgeInsets.symmetric(vertical: AppPadding.smallPaddingValue)
          ),
          onPressed: () => showComingSoonDialog(context), 
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Leaderboard"),
              SizedBox(width: AppPadding.smallPaddingValue,),
              SvgPicture.asset(Assets.images.medal)
            ],
          )
        )
      ],
    );
  }
}

class _MenuButtonSmall extends StatelessWidget {
  const _MenuButtonSmall({
    required this.text,
    required this.iconCount, 
    required this.onPressed,
    this.backgroundColor
  });

  final String text;
  final int iconCount;
  final VoidCallback onPressed;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.sizeOf(context);

    return SizedBox(
      height: size.height * 0.13 - AppPadding.mediumPaddingValue/2,
      child: FilledButton(
        onPressed: onPressed, 
        style: FilledButton.styleFrom(
          backgroundColor: backgroundColor
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                iconCount, 
                (context) => SvgPicture.asset(Assets.icons.person)
              )
            ),
            AutoSizeText(text),
          ],
        )
      ),
    );
  }
}
