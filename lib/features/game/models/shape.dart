import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobile_tetris_multiplayer/features/game/models/block.dart';
import 'package:mobile_tetris_multiplayer/features/game/models/color_type.dart';
import 'package:mobile_tetris_multiplayer/features/game/models/direction.dart';
import 'package:mobile_tetris_multiplayer/features/game/models/game.dart';
import 'package:mobile_tetris_multiplayer/features/game/widgets/game_shapes.dart';

abstract class Shape {
  Shape(this.blocks, this.center) : colorType = ColorType.random();

  List<Block> blocks;
  Block center;
  ColorType colorType;

  void move(Direction direction){
    center.move(direction);
    for (var block in blocks) {
      block.move(direction);
    }
  }

  bool canMove(Direction direction, Board board) => 
      blocks.every((block)=> block.canMove(direction, board));
  
  factory Shape.random() => switch (Random().nextInt(7)) {
    0 => LeftL(),
    1 => RightL(),
    2 => TShape(),
    3 => IShape(),
    4 => OShape(),
    5 => ZShape(),
    6 => SShape(),
    _ => OShape(),
  };

  Widget getShapeWidget() {
    return switch (this) {
      LeftL _ => LeftLShape(color: colorType),
      RightL _=> RightLShape(color: colorType),
      TShape _ => TShapeWidget(color: colorType),
      IShape _ => IShapeWidget(color: colorType),
      OShape _ => OShapeWidget(color: colorType),
      ZShape _ => ZShapeWidget(color: colorType),
      SShape _ => SShapeWidget(color: colorType),
      _ => OShapeWidget(color: colorType),
    };
  }
}

class LeftL extends Shape {
  LeftL() : super([
    Block(0, 0),
    Block(1, 0),
    Block(2, 0),
    Block(2, 1),
  ], Block(1, 0));
}

class RightL extends Shape {
  RightL() : super([
    Block(0, 1),
    Block(1, 1),
    Block(2, 1),
    Block(2, 0),
  ], Block(1, 1));
}

class TShape extends Shape {
  TShape() : super([
    Block(0, 0),
    Block(1, 0),
    Block(2, 0),
    Block(1, 1),
  ], Block(1, 0));
}

class IShape extends Shape {
  IShape() : super([
    Block(0, 0),
    Block(1, 0),
    Block(2, 0),
    Block(3, 0),
  ], Block(1, 0));
}

class OShape extends Shape {
  OShape() : super([
    Block(0, 0),
    Block(0, 1),
    Block(1, 0),
    Block(1, 1),
  ], Block(0, 0));
}

class ZShape extends Shape {
  ZShape() : super([
    Block(0, 0),
    Block(1, 0),
    Block(1, 1),
    Block(2, 1),
  ], Block(1, 0));
}

class SShape extends Shape {
  SShape() : super([
    Block(0, 1),
    Block(1, 1),
    Block(1, 0),
    Block(2, 0),
  ], Block(1, 1));
}
