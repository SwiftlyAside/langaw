import 'dart:ui';

import 'package:flame/components.dart';
import 'package:langaw/components/fly.dart';
import 'package:langaw/langaw_game.dart';

class MachoFly extends Fly {
  @override
  double get speed => game.tileSize * 2.5;

  MachoFly(LangawGame game, double x, double y) : super(game) {
    flyRect = Rect.fromLTWH(
      x,
      y,
      game.tileSize * 2.025,
      game.tileSize * 2.025,
    );
    initialize();
  }

  void initialize() async {
    flyingSprite = [];
    flyingSprite.add(await Sprite.load('flies/macho-fly-1.png'));
    flyingSprite.add(await Sprite.load('flies/macho-fly-2.png'));
    deadSprite = await Sprite.load('flies/macho-fly-dead.png');
  }
}
