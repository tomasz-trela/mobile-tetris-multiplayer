import 'package:flutter/material.dart';
import 'package:mobile_tetris_multiplayer/features/game/models/color_type.dart';
import 'package:mobile_tetris_multiplayer/features/game/widgets/game_block.dart';

class LeftLShape extends StatelessWidget {
  final ColorType color;

  const LeftLShape({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 1,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GameBlock(colorType: color, dimension: 15,),
        GameBlock(colorType: color, dimension: 15,),
        Column(
          spacing: 1,
          mainAxisSize: MainAxisSize.min,
          children: [
            GameBlock(colorType: color, dimension: 15,),
            GameBlock(colorType: color, dimension: 15,),
          ],
        ),
      ],
    );
  }
}

class RightLShape extends StatelessWidget {
  final ColorType color;

  const RightLShape({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      spacing: 1,
      mainAxisSize: MainAxisSize.min,
      children: [
        GameBlock(colorType: color, dimension: 15,),
        GameBlock(colorType: color, dimension: 15,),
        Column(
          spacing: 1,
          mainAxisSize: MainAxisSize.min,
          children: [
            GameBlock(colorType: color, dimension: 15,),
            GameBlock(colorType: color, dimension: 15,),
          ],
        ),
      ],
    );
  }
}

class TShapeWidget extends StatelessWidget {
  final ColorType color;

  const TShapeWidget({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 1,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          spacing: 1,
          mainAxisSize: MainAxisSize.min,
          children: List.generate(3, (index) => GameBlock(colorType: color, dimension: 15,))
        ),
        GameBlock(colorType: color, dimension: 15,),
      ],
    );
  }
}

class IShapeWidget extends StatelessWidget {
  final ColorType color;

  const IShapeWidget({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 7.5),
      child: Row(
        spacing: 1,
        mainAxisSize: MainAxisSize.min,
        children: List.generate(4, (index) => GameBlock(colorType: color, dimension: 15,)),
      ),
    );
  }
}

class OShapeWidget extends StatelessWidget {
  final ColorType color;

  const OShapeWidget({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 1,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        2,
        (_) => Row(
          spacing: 1,
          mainAxisSize: MainAxisSize.min,
          children: List.generate(2, (index) => GameBlock(colorType: color, dimension: 15,)),
        ),
      ),
    );
  }
}

class ZShapeWidget extends StatelessWidget {
  final ColorType color;

  const ZShapeWidget({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 1,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          spacing: 1,
          mainAxisSize: MainAxisSize.min,
          children: [
            GameBlock(colorType: color, dimension: 15,),
            GameBlock(colorType: color, dimension: 15,),
            SizedBox.square(dimension: 15,),
          ],
        ),
        Row(
          spacing: 1,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox.square(dimension: 15,),
            GameBlock(colorType: color, dimension: 15,),
            GameBlock(colorType: color, dimension: 15,),
          ],
        ),
      ],
    );
  }
}

class SShapeWidget extends StatelessWidget {
  final ColorType color;

  const SShapeWidget({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 1,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          spacing: 1,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox.square(dimension: 15,),
            GameBlock(colorType: color, dimension: 15,),
            GameBlock(colorType: color, dimension: 15,),
          ],
        ),
        Row(
          spacing: 1,
          mainAxisSize: MainAxisSize.min,
          children: [
            GameBlock(colorType: color, dimension: 15,),
            GameBlock(colorType: color, dimension: 15,),
            SizedBox.square(dimension: 15,),
          ],
        ),
      ],
    );
  }
}