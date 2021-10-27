import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/flame.dart';
import 'package:langaw/langaw_game.dart';

class Backyard {
  late final LangawGame game;
  late Sprite bgSprite;
  late Rect bgRect;

  Backyard(this.game) {
    final image = Flame.images.fromCache('bg/backyard.png');
    bgSprite = Sprite(image);
    bgRect = Rect.fromLTWH(
      0,
      game.screenSize.height - (game.tileSize * 23),
      game.tileSize * 9,
      game.tileSize * 23,
    );
  }

  void render(Canvas c) {}

  void update(double t) {}
}
