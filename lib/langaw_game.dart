import 'dart:math';
import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:langaw/components/agile_fly.dart';
import 'package:langaw/components/drooler_fly.dart';
import 'package:langaw/components/house_fly.dart';
import 'package:langaw/components/hungry_fly.dart';
import 'package:langaw/components/macho_fly.dart';

import 'components/backyard.dart';
import 'components/fly.dart';

class LangawGame extends FlameGame with TapDetector {
  late Rect screenSize;
  late double tileSize;
  late Backyard background;
  late List<Fly> flies;
  late Random rnd;

  @override
  Future<void>? onLoad() {
    flies = <Fly>[];
    rnd = Random();

    background = Backyard(this);
    spawnFly();
    return super.onLoad();
  }

  void spawnFly() {
    double x = rnd.nextDouble() * (screenSize.width - (tileSize * 2.025));
    double y = rnd.nextDouble() * (screenSize.height - (tileSize * 2.025));
    switch (rnd.nextInt(5)) {
      case 0:
        flies.add(HouseFly(this, x, y));
        break;
      case 1:
        flies.add(DroolerFly(this, x, y));
        break;
      case 2:
        flies.add(AgileFly(this, x, y));
        break;
      case 3:
        flies.add(MachoFly(this, x, y));
        break;
      case 4:
        flies.add(HungryFly(this, x, y));
        break;
    }
  }

  @override
  void render(Canvas canvas) {
    background.render(canvas);

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
    screenSize = canvasSize.toRect();
    tileSize = screenSize.width / 9;
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
