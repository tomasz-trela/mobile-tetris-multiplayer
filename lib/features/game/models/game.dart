import 'dart:collection';

import 'package:mobile_tetris_multiplayer/features/game/models/color_type.dart';
import 'package:mobile_tetris_multiplayer/features/game/models/direction.dart';
import 'package:mobile_tetris_multiplayer/features/game/models/shape.dart';

typedef Board =  List<List<ColorType?>>;

class Game {
  Game({
    this.score = 0,
    this.lines = 0,
    this.level = 1,
    this.isActive = true,
  }) : board = List.generate(boardHeigth, (_) => List.generate(boardWidth, (_) => null)),
  upcomingShapes = Queue.from(List.generate(4, (index) => Shape.random()));

  static final boardWidth = 10;
  static final boardHeigth = 20;
  final Board board;
  int score;
  int lines;
  int level;
  final Queue<Shape> upcomingShapes;
  bool isActive;

  void printShape(){
    for (final block in upcomingShapes.first.blocks) {
      board[block.y][block.x] = upcomingShapes.first.colorType; 
    }
  }

  void clearShape() {
    for (final block in upcomingShapes.first.blocks) {
      board[block.y][block.x] = null; 
    }
  }

  void checkRows(){
    for (final row in board) {
      if(row.every((block) => block != null)) {
        score += 1000;
        lines ++;
      }
    }
  }

  void moveShape(Direction direction){
    if(checkEndGame()){
      isActive = false;
      return;
    }
    clearShape();
    if(!upcomingShapes.first.canMove(direction, board)){
      printShape();
      if(direction == Direction.down){
        upcomingShapes.removeFirst();
        upcomingShapes.addLast(Shape.random());
      }
      return;
    }
    upcomingShapes.first.move(direction);
    printShape();
  }

  bool checkEndGame() => !board.first.every((block) => block == null);

  void tick() => moveShape(Direction.down);
  
}