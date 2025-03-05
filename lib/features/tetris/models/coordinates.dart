import 'package:flutter/material.dart';

class Coordinates {
  int x;
  int y;

  Coordinates(this.x, this.y);

  void moveDown(){
    y++;
  }

  void moveLeft(){
    x--;
  }

  void moveRight(){
    x++;
  }

  bool canMoveDown(List<List<Color>> board){
    return y < 19 && board[y + 1][x] == Colors.grey.shade800;
  }

  bool canMoveLeft(List<List<Color>> board){
    return x > 0 && board[y][x - 1] == Colors.grey.shade800;
  }

  bool canMoveRight(List<List<Color>> board){
    return x < 9 && board[y][x + 1] == Colors.grey.shade800;
  }

  Coordinates getNextDown(){
    return Coordinates(x, y + 1);
  }

  Coordinates copyWith({int? x, int? y}) {
    return Coordinates(x ?? this.x, y ?? this.y);
  }

  @override
  String toString() {
    return "x: $x, y: $y";
  }
}