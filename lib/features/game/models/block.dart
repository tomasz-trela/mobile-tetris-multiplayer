import 'package:mobile_tetris_multiplayer/features/game/models/direction.dart';
import 'package:mobile_tetris_multiplayer/features/game/models/game.dart';

class Block {
  Block(this.x, this.y);

  int x;
  int y;

  void move(Direction direction) => 
  switch (direction) {
    Direction.up    => y--,
    Direction.down  => y++,
    Direction.left  => x--,
    Direction.right => x++
  };

  bool canMove(Direction direction, Board board) {
    final newBlock = Block(x, y);
    newBlock.move(direction);

    final newX = newBlock.x;
    final newY = newBlock.y;
    
    if (newX < 0 || newX >= Game.boardWidth || newY < 0 || newY >= Game.boardHeigth) {
      return false; 
    }

    if(board[newY][newX] != null){
      return false;
    }

    return true;
  }

}