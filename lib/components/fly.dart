import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:langaw/langaw_game.dart';

class Fly {
  late final LangawGame game;
  late Rect flyRect;
  late List<Sprite> flyingSprite;
  late Sprite deadSprite;
  late Offset targetLocation;
  double flyingSpriteIndex = 0;
  bool isDead = false;
  bool isOffScreen = false;

  double get speed => game.tileSize * 3;

  Fly(this.game) {
    setTargetLocation();
  }

  void render(Canvas c) {
    if (isDead) {
      deadSprite.renderRect(c, flyRect.inflate(2));
    } else {
      flyingSprite[flyingSpriteIndex.toInt()].renderRect(c, flyRect.inflate(2));
    }
  }

  void update(double t) {
    if (isDead) {
      flyRect = flyRect.translate(0, game.tileSize * 12 * t);
      if (flyRect.top > game.screenSize.height) {
        isOffScreen = true;
      }
    } else {
      flyingSpriteIndex += 30 * t;
      if (flyingSpriteIndex >= 2) {
        flyingSpriteIndex -= 2;
      }
      double stepDistance = speed * t;
      Offset toTarget = targetLocation - Offset(flyRect.left, flyRect.top);
      if (stepDistance < toTarget.distance) {
        Offset stepToTarget =
            Offset.fromDirection(toTarget.direction, stepDistance);
        flyRect = flyRect.shift(stepToTarget);
      } else {
        flyRect = flyRect.shift(toTarget);
        setTargetLocation();
      }
    }
  }

  void onTapDown() {
    isDead = true;
    game.spawnFly();
  }

  void setTargetLocation() {
    double x =
        game.rnd.nextDouble() * (game.screenSize.width - game.tileSize * 2.025);
    double y = game.rnd.nextDouble() *
        (game.screenSize.height - game.tileSize * 2.025);
    targetLocation = Offset(x, y);
  }
}
