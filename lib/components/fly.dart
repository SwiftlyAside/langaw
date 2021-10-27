import 'dart:ui';

import 'package:flame/extensions.dart';
import 'package:langaw/langaw_game.dart';

class Fly {
  late final LangawGame game;
  late Rect flyRect;
  late Paint flyPaint;
  bool isDead = false;
  bool isOffScreen = false;

  Fly(this.game, double x, double y) {
    flyRect = Rect.fromLTWH(x, y, game.tileSize, game.tileSize);
    flyPaint = Paint();
    flyPaint.color = const Color(0xff6ab04c);
  }

  void render(Canvas c) {
    c.drawRect(flyRect, flyPaint);
  }

  void update(double t) {
    if (isDead) {
      flyRect = flyRect.translate(0, game.tileSize * 12 * t);
      if (flyRect.top > game.screenSize.height) {
        isOffScreen = true;
      }
    }
  }

  void onTapDown() {
    isDead = true;
    flyPaint.color = const Color(0xffff4757);
    game.spawnFly();
  }
}
