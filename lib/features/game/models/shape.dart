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

  void rotate(Board board){
    List<Block> newBlocks = [];
    bool canRotate = true;
    for (var element in blocks) {
      if(element == center){
        newBlocks.add(element);
      }else{
        int newX = center.x +(element.y-center.y);
        int newY = center.y -(element.x-center.x);
        if(newX < 0 || newX > 9 || newY < 0 || newY > 19 || board[newY][newX] != null){
          canRotate = false;
          break;
        }
        newBlocks.add(Block(newX, newY));
      }
    }

    if(canRotate) blocks = newBlocks;
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

  @override
  void rotate(Board board) {
    //This shape doesn't rotate
  }
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
