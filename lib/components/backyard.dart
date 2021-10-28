import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:langaw/langaw_game.dart';

class Backyard {
  late final LangawGame game;
  Sprite? bgSprite;
  late Rect bgRect;

  Backyard(this.game) {
    initialize();
  }

  void initialize() async {
    bgSprite = await Sprite.load('bg/backyard.png');
    bgRect = Rect.fromLTWH(
      0,
      game.screenSize.height - (game.tileSize * 23),
      game.tileSize * 9,
      game.tileSize * 23,
    );
  }

  void render(Canvas c) {
    bgSprite?.renderRect(c, bgRect);
  }

  void update(double t) {}
}
