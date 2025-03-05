import 'package:flutter/material.dart';
import 'package:mobile_tetris_multiplayer/features/tetris/models/coordinates.dart';

class Shape {
  List<Coordinates> coordinates;
  final Color color;
  final Coordinates center;

  Shape(this.coordinates, this.color, this.center);

  void moveDown(){
    for (var element in coordinates) {
      element.moveDown();
    }
    center.moveDown();

  }

  void moveLeft(){
    for (var element in coordinates) {
      element.moveLeft();
    }
    center.moveLeft();
  }

  void moveRight(){
    for (var element in coordinates) {
      element.moveRight();
    }
    center.moveRight();
  }

  void rotate(){
    List<Coordinates> newCoordinates = [];
    bool canRotate = true;
    for (var element in coordinates) {
      if(element == center){
        newCoordinates.add(element);
      }else{
        int newX = center.x +(element.y-center.y);
        int newY = center.y -(element.x-center.x);
        if(newX < 0 || newX > 9 || newY < 0 || newY > 19){
          canRotate = false;
          break;
        }
        newCoordinates.add(Coordinates(newX, newY));
      }
    }

    if(canRotate) coordinates = newCoordinates;
  }

  bool canMoveDown(List<List<Color>> board){
    return getBottomCoordinates().every((element) => element.canMoveDown(board));
  }

  bool canMoveLeft(List<List<Color>> board){
    return getLeftCoordinates().every((element) => element.canMoveLeft(board));
  }

  bool canMoveRight(List<List<Color>> board){
    return getRightCoordinates().every((element) => element.canMoveRight(board));
  }

  List<Coordinates> getNextDownCoordinates(){
    List<Coordinates> result = [];
    for (var element in coordinates) {
      result.add(element.getNextDown());
    }
    return result;
  }

  Shape copyWith({List<Coordinates>? coordinates, Color? color, Coordinates? center}) {
    List<Coordinates> newCoordinates = [];
    for (var element in coordinates ?? this.coordinates) {
      newCoordinates.add(element.copyWith());
    }
    return Shape(coordinates ?? newCoordinates, color ?? this.color, center ?? this.center.copyWith());
  }

  List<Coordinates> getBottomCoordinates(){
    List<Coordinates> result = [];

    for(var coordinate in coordinates){
      if(result.isEmpty) {
        result.add(coordinate);
      } else{
        bool found = false;
        for(int i=0; i<result.length; i++ ){
          if(coordinate.x == result[i].x){
            if(coordinate.y > result[i].y) {
              result[i] = coordinate;
            }
            found = true;
          }
        }
        if(!found){
          result.add(coordinate);
        }
      }
    }
    return result;
  }

  List<Coordinates> getLeftCoordinates(){
    List<Coordinates> result = [];

    for(var coordinate in coordinates){
      if(result.isEmpty) {
        result.add(coordinate);
      }else{
        bool found = false;
        for(int i=0; i<result.length; i++ ){
          if(coordinate.y == result[i].y ){
            if(coordinate.x < result[i].x) {
              result[i] = coordinate;
            }
            found = true;
          }
        }
        if(!found){
          result.add(coordinate);
        }
      }
    }
    return result;
  }

  List<Coordinates> getRightCoordinates(){
    List<Coordinates> result = [];

    for(var coordinate in coordinates){
      if(result.isEmpty) {
        result.add(coordinate);
      } else{
        bool found = false;
        for(int i=0; i<result.length; i++ ){
          if(coordinate.y == result[i].y ){
            if(coordinate.x > result[i].x) {
              result[i] = coordinate;
            }
            found = true;
          }
        }
        if(!found){
          result.add(coordinate);
        }
      }
    }
    return result;
  }

  @override
  String toString() {
    return "coordinates: $coordinates, color: $color, center: $center";
  }
}