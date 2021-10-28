import 'dart:ui';

import 'package:flame/components.dart';
import 'package:langaw/components/fly.dart';
import 'package:langaw/langaw_game.dart';

class DroolerFly extends Fly {
  @override
  double get speed => game.tileSize * 1.5;

  DroolerFly(LangawGame game, double x, double y) : super(game) {
    flyRect = Rect.fromLTWH(
      x,
      y,
      game.tileSize * 1.5,
      game.tileSize * 1.5,
    );
    initialize();
  }

  void initialize() async {
    flyingSprite = [];
    flyingSprite.add(await Sprite.load('flies/drooler-fly-1.png'));
    flyingSprite.add(await Sprite.load('flies/drooler-fly-2.png'));
    deadSprite = await Sprite.load('flies/drooler-fly-dead.png');
  }
}
