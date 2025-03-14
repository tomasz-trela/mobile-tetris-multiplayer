import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile_tetris_multiplayer/features/game/models/direction.dart';
import 'package:mobile_tetris_multiplayer/features/game/models/game.dart';

class SingleplayerNotifier extends ChangeNotifier {
  Timer? _gameLoopTimer;
  Game game = Game();

  void startGame() {
    game.printShape();
    _gameLoopTimer = Timer.periodic(const Duration(seconds: 1), (_) => nextTick());
    notifyListeners();
  }

  void move(Direction direction) {
    game.moveShape(direction);
    notifyListeners();
  }

  void nextTick() {
    game.tick();
    if(!game.isActive) _gameLoopTimer?.cancel();
    notifyListeners();
  }

  @override
  void dispose() {
    _gameLoopTimer?.cancel();
    super.dispose();
  }
}
