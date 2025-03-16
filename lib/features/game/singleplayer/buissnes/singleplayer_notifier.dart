import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:mobile_tetris_multiplayer/features/game/models/direction.dart';
import 'package:mobile_tetris_multiplayer/features/game/models/game.dart';
import 'package:mobile_tetris_multiplayer/features/game/models/shape.dart';

class SingleplayerNotifier extends ChangeNotifier {
  Timer? _gameLoopTimer;
  int score = 0;
  int lines = 0;
  int level = 0;
  bool isOver = false;
  double interval = 1000;
  Queue<Shape> upcomingShapes = Queue.from(List.generate(4, (index) => Shape.random()));
  Board board = List.generate(Game.boardHeigth, (_) => List.generate(Game.boardWidth, (_) => null));

  void startGame() {
    _printShape();
    _gameLoopTimer = Timer.periodic(Duration(milliseconds: interval.toInt()), (_) => moveShape(Direction.down));
    notifyListeners();
  }

  void onLongPressStart(){
    _gameLoopTimer?.cancel();
    _gameLoopTimer = Timer.periodic(Duration(milliseconds: 50), (_) => moveShape(Direction.down));
    notifyListeners();
  }

  void onLongPressEnd(){
    _gameLoopTimer?.cancel();
    _gameLoopTimer = Timer.periodic(Duration(milliseconds: interval.toInt()), (_) => moveShape(Direction.down));
    notifyListeners();
  }

  void restartGame(){
    score = 0;
    lines = 0;
    level = 0;
    isOver = false;
    interval = 1000;
    upcomingShapes = Queue.from(List.generate(4, (index) => Shape.random()));
    board = List.generate(Game.boardHeigth, (_) => List.generate(Game.boardWidth, (_) => null));
    _printShape();
    _gameLoopTimer = Timer.periodic(Duration(milliseconds: interval.toInt()), (_) => moveShape(Direction.down));
    notifyListeners();
  }

  void pauseUnpauseGame() {
    if (_gameLoopTimer?.isActive ?? false) {
      _gameLoopTimer?.cancel();
      _gameLoopTimer = null; 
    } else {
      _gameLoopTimer = Timer.periodic(Duration(milliseconds: interval.toInt()), (_) => moveShape(Direction.down));
    }
    notifyListeners();
  }

  bool get isRunning => _gameLoopTimer != null;

  void _printShape(){
    for (final block in upcomingShapes.first.blocks) {
      board[block.y][block.x] = upcomingShapes.first.colorType; 
    }
  }

  void _clearShape() {
    for (final block in upcomingShapes.first.blocks) {
      board[block.y][block.x] = null; 
    }
  }

  void checkRows() {
    int turnLines = 0;
    int turnPoints = 0;
    for (int y = 0; y < board.length; y++) {
      if (board[y].every((block) => block != null)) {
        turnPoints += 1000;
        turnLines++;
        if(lines ~/ 10 > level){
          level = lines ~/ 10;
          interval *= 0.93;
          _gameLoopTimer?.cancel();
          _gameLoopTimer = Timer.periodic(Duration(milliseconds: interval.toInt()), (_) => moveShape(Direction.down));
        }

        for (int i = y; i > 0; i--) {
          board[i] = List.from(board[i - 1]); 
        }

        board[0] = List.generate(Game.boardWidth, (_) => null);
      }
    }
    lines += turnLines;
    score += turnPoints * turnLines;
  }

  void rotate() {
    _clearShape();
    upcomingShapes.first.rotate(board);
    _printShape();
    notifyListeners();
  }

  void moveShape(Direction direction) {
    _clearShape();  

    if (!upcomingShapes.first.canMove(direction, board)) {
      _printShape();
      if (direction == Direction.down) {
        checkRows(); 
        upcomingShapes.removeFirst();
        upcomingShapes.addLast(Shape.random());
        if (!board.first.every((block) => block == null)) {
          isOver = true;
          _gameLoopTimer?.cancel();
          notifyListeners();
          return;
        }
        _printShape();
      }
      notifyListeners();
      return;
    }

    upcomingShapes.first.move(direction);
    _printShape(); 
    notifyListeners();
  }

  @override
  void dispose() {
    _gameLoopTimer?.cancel();
    super.dispose();
  }
}
