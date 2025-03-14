import 'package:flutter/material.dart';
import 'package:mobile_tetris_multiplayer/app/theme/theming.dart';
import 'package:mobile_tetris_multiplayer/features/game/models/shape.dart';

class UpcomingSection extends StatelessWidget {
  const UpcomingSection({
    super.key, 
    required this.shapes
  });

  final List<Shape> shapes;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: AppPadding.smallBorderRaduis,
        color: colorScheme.surfaceContainer,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(0x30),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(2, 2)
          ),
        ]
      ),
      child: Column(
        children: [
          Text(
            "UPCOMING",
            style: textTheme.headlineSmall,
          ),
          SizedBox(height: 6,),
          Row(
            mainAxisSize: MainAxisSize.max,
            spacing: AppPadding.smallPaddingValue,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(3, (index) => _PreviewShape(shape: shapes[index],)),
          ),
        ],
      ),
    );
  }
}

class _PreviewShape extends StatelessWidget {
  const _PreviewShape({
    required this.shape,
  });

  final Shape shape;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: AppPadding.smallBorderRaduis,
          color: colorScheme.surface,
        ),
        alignment: Alignment.center,
        child: shape.getShapeWidget(),
      ),
    );
  }
}