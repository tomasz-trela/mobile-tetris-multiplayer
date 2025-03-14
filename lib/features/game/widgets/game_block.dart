import 'package:flutter/material.dart';
import 'package:mobile_tetris_multiplayer/app/theme/theming.dart';
import 'package:mobile_tetris_multiplayer/features/game/models/color_type.dart';

class GameBlock extends StatelessWidget {
  const GameBlock({
    super.key, 
    this.colorType, 
    this.dimension,
  });

  final double? dimension;
  final ColorType? colorType;
  
  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: dimension,
      child: Container(
        padding: EdgeInsets.all(3),
        decoration: BoxDecoration(
          borderRadius: AppPadding.smallBorderRaduis,
          color: colorType?.dark ?? ColorsConsts.greyBlue
        ),
        child: colorType == null 
          ? null 
          : Container(
            decoration: BoxDecoration(
              borderRadius: AppPadding.smallBorderRaduis,
              color: colorType!.light,
            ),
          ),
      ),
    );
  }
}