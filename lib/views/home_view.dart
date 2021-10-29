import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:langaw/langaw_game.dart';

class HomeView {
  final LangawGame game;
  late Rect titleRect;
  late Sprite titleSprite;

  HomeView(this.game) {
    titleRect = Rect.fromLTWH(
      game.tileSize,
      game.screenSize.height / 2 - game.tileSize * 4,
      game.tileSize * 7,
      game.tileSize * 4,
    );
    initialize();
  }

  void initialize() async {
    titleSprite = await Sprite.load('branding/title.png');
  }

  void render(Canvas c) {
    titleSprite.renderRect(c, titleRect);
  }

  void update(double t) {}
}
