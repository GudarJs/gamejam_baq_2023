import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:gamejam_baq_2023/main.dart';
import 'package:gamejam_baq_2023/sounds/music_tracks.dart';
import 'package:gamejam_baq_2023/sounds/sound_effects.dart';

class StartMenu extends StatelessWidget {
  // Reference to parent game.
  final GameJam2023 game;

  const StartMenu({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    const whiteTextColor = Color.fromRGBO(255, 255, 255, 1.0);
    return Material(
      color: Colors.transparent,
      child: Center(
        child: GestureDetector(
          onTap: () {
            SoundEffects.play();
            game.bgmMain.play('background_music.mp3');
            game.pushSpeed = 18;
            double startGroundHeight = game.groundObjects.first.height;
            Vector2 lyaSize = Vector2(305 / 2, 419 / 2);
            game.lya
              ..animation = game.runAnimation
              ..size = lyaSize
              ..position = Vector2(game.lya.position.x, game.mapHeight - lyaSize.y - startGroundHeight);
            game.overlays.remove('StartMenu');
          },
          child: Container(
            padding: const EdgeInsets.all(10.0),
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.7),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Collect all instruments!',
                  style: TextStyle(
                    color: whiteTextColor,
                    fontSize: 30,
                    fontFamily: 'avigea',
                    letterSpacing: 7,
                  ),
                ),
                const Text(
                  'Tap to play',
                  style: TextStyle(
                    color: whiteTextColor,
                    fontSize: 60,
                    fontFamily: 'avigea',
                    letterSpacing: 7,
                  ),
                ),
                Image.asset(
                  'assets/images/tap.png',
                  color: Colors.white,
                  width: 80,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
