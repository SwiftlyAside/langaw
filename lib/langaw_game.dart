import 'dart:math';
import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:langaw/components/fly.dart';

class LangawGame extends FlameGame with TapDetector {
  late Vector2 gameSize;
  late double tileSize;
  late List<Fly> flies;
  late Random rnd;

  @override
  Future<void>? onLoad() {
    flies = <Fly>[];
    rnd = Random();
    spawnFly();
    return super.onLoad();
  }

  void spawnFly() {
    double x = rnd.nextDouble() * (gameSize.x - tileSize);
    double y = rnd.nextDouble() * (gameSize.y - tileSize);
    flies.add(Fly(this, x, y));
  }

  @override
  void render(Canvas canvas) {
    Rect bgRect = Rect.fromLTWH(0, 0, gameSize.x, gameSize.y);
    Paint bgPaint = Paint();
    bgPaint.color = const Color(0xff576574);
    canvas.drawRect(bgRect, bgPaint);

    for (var fly in flies) {
      fly.render(canvas);
    }
    super.render(canvas);
  }

  @override
  void update(double dt) {
    for (var fly in flies) {
      fly.update(dt);
    }
    flies.removeWhere((Fly fly) => fly.isOffScreen);
    super.update(dt);
  }

  @override
  void onGameResize(Vector2 canvasSize) {
    gameSize = canvasSize;
    tileSize = gameSize.x / 9;
    super.onGameResize(canvasSize);
  }

  @override
  void onTapDown(TapDownInfo info) {
    for (var fly in List<Fly>.from(flies)) {
      if (fly.flyRect.contains(info.eventPosition.global.toOffset())) {
        fly.onTapDown();
      }
    }
    super.onTapDown(info);
  }
}
