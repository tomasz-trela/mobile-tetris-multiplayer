import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mobile_tetris_multiplayer/features/game/models/coordinates.dart';
import 'package:mobile_tetris_multiplayer/features/game/models/shape.dart';


class BoardModel extends ChangeNotifier {
  final List<List<Color>> board = List.generate(20, (index) => List.filled(10, Colors.grey.shade800));

  final List<Shape> nextShapes = [
      Shape([Coordinates(0, 0), Coordinates(1, 0), Coordinates(2, 0), Coordinates(3, 0)], Colors.red, Coordinates(1, 0)),
      Shape([Coordinates(0, 0), Coordinates(1, 0), Coordinates(2, 0), Coordinates(2, 1)], Colors.blue, Coordinates(1, 0)),
      Shape([Coordinates(0, 0), Coordinates(1, 0), Coordinates(2, 0), Coordinates(1, 1)], Colors.green, Coordinates(1, 0)),
      Shape([Coordinates(0, 0), Coordinates(1, 0), Coordinates(1, 1), Coordinates(2, 1)], Colors.yellow, Coordinates(1, 1)),
      Shape([Coordinates(0, 0), Coordinates(1, 0), Coordinates(1, 1), Coordinates(2, 0)], Colors.purple, Coordinates(1, 0)),
      Shape([Coordinates(0, 0), Coordinates(1, 0), Coordinates(1, 1), Coordinates(2, 1)], Colors.orange, Coordinates(1, 1)),
      Shape([Coordinates(0, 0), Coordinates(1, 0), Coordinates(2, 0), Coordinates(1, 1)], Colors.pink, Coordinates(1, 0)),
    ];

  int actualShapeIndex = 0;
  late Shape shape = nextShapes[actualShapeIndex].copyWith();
  bool isRunning = false;
  bool isEndGame = false;
  Timer? timer;
  int score = 0;
  int lines = 0;
  int level = 1;

  void startStopGame() {
    isRunning = !isRunning;
    if (isRunning) {
      printShape();
      timer = Timer.periodic(const Duration(milliseconds: 1000), (timer) => moveDown());
    } else {
      timer?.cancel();
    }
    notifyListeners();
  }

  void moveDown() {
    if(shape.canMoveDown(board)){
      move(shape.moveDown);
    }else{
      getNewShape();
    }
  }

  void move(Function moveFunction) {
    for (var element in shape.coordinates) {
      board[element.y][element.x] = Colors.grey.shade800;
    }
    moveFunction();
    printShape();

    notifyListeners();
  }

  void printShape(){
    for (var element in shape.coordinates) {
      board[element.y][element.x] = shape.color;
    }
  }

  void moveLeft() {
    if(shape.canMoveLeft(board)){
      move(shape.moveLeft);
    }
  }

  void moveRight() {
    if(shape.canMoveRight(board)){
      move(shape.moveRight);
    }
  }

  void getNewShape(){
    checkLinesAndAddPoints();
    checkEndGame();
    actualShapeIndex++;
    if (actualShapeIndex >= nextShapes.length) {
      actualShapeIndex = 0;
    }
    shape = nextShapes[actualShapeIndex].copyWith();
    printShape();
    notifyListeners();
  }

  void checkLinesAndAddPoints(){
    score += Random().nextInt(5) + 10;

    int prevLines = lines;

    for(int i=0; i<board.length; i++){
      bool found = false;
      for(var cell in board[i]){
        if(cell == Colors.grey.shade800){
          found = true;
          break;
        }
      }
      if(!found){
        board.removeAt(i);
        i--;
        lines++;
        board.insert(0, List.filled(10, Colors.grey.shade800));
      }
    }

    if(prevLines != lines){
      int differece = lines - prevLines;
      double bonus = sqrt(differece) * 100 ;
      score += bonus.toInt();
    }
  }

  void checkEndGame(){
    for(var cell in board[0]){
      if(cell != Colors.grey.shade800){
        isEndGame = true;
        timer?.cancel();
        notifyListeners();
        break;
      }
    }
  }

  void resetGame(){
    board.clear();
    for(int i=0; i<20; i++){
      board.add(List.filled(10, Colors.grey.shade800));
    }
    nextShapes.shuffle();
    actualShapeIndex = 0;
    shape = nextShapes[actualShapeIndex].copyWith();
    isRunning = false;
    isEndGame = false;
    score = 0;
    lines = 0;
    level = 1;
    notifyListeners();
  }

  void rotate(){
    move(shape.rotate);
  }
}
