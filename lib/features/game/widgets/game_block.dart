import 'package:flutter/material.dart';
import 'package:mobile_tetris_multiplayer/app/theme/theming.dart';

class GameBlock extends StatelessWidget {
  const GameBlock({
    super.key, 
    this.backgroundColor = ColorsConsts.greyBlue, 
    this.child
  });

  final Color backgroundColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: AppPadding.smallBorderRaduis,
          color: backgroundColor
        ),
        child: child,
      ),
    );
  }
}