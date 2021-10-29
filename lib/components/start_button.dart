import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:langaw/langaw_game.dart';

class StartButton {
  late final LangawGame game;
  late Rect rect;
  late Sprite sprite;

  StartButton(this.game) {
    rect = Rect.fromLTWH(
      game.tileSize * 1.5,
      game.screenSize.height / .75 - game.tileSize * 1.5,
      game.tileSize * 6,
      game.tileSize * 3,
    );
    initialize();
  }

  void initialize() async {
    sprite = await Sprite.load('ui/start-button.png');
  }

  void render(Canvas c) {
    sprite.renderRect(c, rect);
  }

  void update(double t) {}

  void onTapDown() {}
}
