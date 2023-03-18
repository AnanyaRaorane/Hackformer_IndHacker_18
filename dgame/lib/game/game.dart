import 'dart:async';

import 'package:dgame/game/bullet.dart';
import 'package:dgame/game/player.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/image_composition.dart' as flame_image;
import 'package:flame/input.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart';

class MyGame extends FlameGame
    with PanDetector, HasCollisionDetection, HasTappables {
  MyGame({
    required this.onGameOver,
    required this.onGameStateUpdate,
  });

  static const _initialHealthPoints = 100;

  /// Callback to notify the parent when the game ends.
  final void Function(bool didWin) onGameOver;

  /// Callback for when the game state updates.
  final void Function(
    Vector2 position,
    int health,
    bool defense,
  ) onGameStateUpdate;

  /// `Player` instance of the player
  late Player _player;

  /// `Player` instance of the opponent
  late Player _opponent;

  bool isGameOver = true;

  int _playerHealthPoint = _initialHealthPoints;

  late final flame_image.Image _playerBulletImage;
  late final flame_image.Image _opponentBulletImage;
  bool isDefense = false;
  bool defenseBtnPressed = false;
  late Timer defenseTimer = Timer(
    3,
    onTick: () {
      isDefense = false;
    },
  );

  bool isIncreaseHealth = false;
  bool healthBtnPressed = false;

  applyDefense() {
    isDefense = true;
    defenseTimer.stop();
    defenseTimer.start();
    defenseBtnPressed = true;
  }

  @override
  Color backgroundColor() {
    return Colors.transparent;
  }

  @override
  Future<void>? onLoad() async {
    // camera.viewport = FixedResolutionViewport(Vector2(540, 960), clip: false);
    final spriteSize = Vector2.all(Player.radius * 2);
    final parallaxComponent = await loadParallaxComponent(
      [
        ParallaxImageData('parallax-space-backgound.png'),
        // ParallaxImageData('parallax-space-big-planet.png'),
        ParallaxImageData('parallax-space-far-planets.png'),
        ParallaxImageData('parallax-space-far-planets.png'),
        // ParallaxImageData('parallax-space-ring-planet.png'),
        ParallaxImageData('parallax-space-stars.png'),
      ],
      // size: spriteSize,
      baseVelocity: Vector2(10, 0),
      // repeat: ImageRepeat.repeatY,

      velocityMultiplierDelta: Vector2(1.8, 1.0),
    );
    add(parallaxComponent);
    final playerImage = await images.load('player.png');
    _player = Player(isMe: true);
    _player.add(SpriteComponent(sprite: Sprite(playerImage), size: spriteSize));
    add(_player);

    final opponentImage = await images.load('opponent.png');
    _opponent = Player(isMe: false);
    _opponent.add(SpriteComponent.fromImage(opponentImage, size: spriteSize));
    add(_opponent);

    _playerBulletImage = await images.load('player-bullet.png');
    _opponentBulletImage = await images.load('opponent-bullet.png');

    final button = ButtonComponent(
      button: CircleComponent(
        radius: 30,
        paint: Paint()..color = Colors.blue.withOpacity(0.5),
      ),
      anchor: Anchor.bottomRight,
      position: Vector2(size.x - 30, size.y - 30),
      onPressed: () {
        print("Tapped");
        // isDefense = true;
        // // defenseTimer.reset();

        // // defenseTimer.start();
        if (defenseBtnPressed) {
          camera.shake(
            intensity: 40,
          );
        } else {
          applyDefense();
        }
      },
    );
    add(button);

    final healthBtn = ButtonComponent(
      button: CircleComponent(
        radius: 30,
        paint: Paint()..color = Colors.red.withOpacity(0.5),
      ),
      anchor: Anchor.bottomRight,
      position: Vector2(size.x - 100, size.y - 30),
      onPressed: () {
        print("Tapped");
        // isDefense = true;
        // // defenseTimer.reset();

        // // defenseTimer.start();
        // applyDefense();

        if (healthBtnPressed) {
          camera.shake(
            intensity: 40,
          );
        } else {
          _playerHealthPoint = _playerHealthPoint + 20;
          if (_playerHealthPoint > 100) {
            _playerHealthPoint = 100;
          }
          _player.updateHealth(_playerHealthPoint.toDouble() / 100);
          healthBtnPressed = true;
        }
      },
    );
    add(healthBtn);

    // final button = ButtonComponent();

    await super.onLoad();
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    _player.move(info.delta.global);
    final mirroredPosition = _player.getMirroredPercentPosition();
    onGameStateUpdate(mirroredPosition, _playerHealthPoint, isDefense);
    super.onPanUpdate(info);
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (isGameOver) {
      return;
    }
    defenseTimer.update(dt);

    // print("the timer is ${defenseTimer.current}");
    for (final child in children) {
      if (child is Bullet && child.hasBeenHit && !child.isMine) {
        if (isDefense == false) {
          _playerHealthPoint = _playerHealthPoint - child.damage;
        }
        final mirroredPosition = _player.getMirroredPercentPosition();
        onGameStateUpdate(mirroredPosition, _playerHealthPoint, isDefense);
        _player.updateHealth(_playerHealthPoint / _initialHealthPoints);
      }
    }
    if (_playerHealthPoint <= 0) {
      endGame(false);
    }
  }

  void startNewGame() {
    isGameOver = false;
    _playerHealthPoint = _initialHealthPoints;

    for (final child in children) {
      if (child is Player) {
        child.position = child.initialPosition;
      } else if (child is Bullet) {
        child.removeFromParent();
      }
    }

    _shootBullets();
  }

  /// shoots out bullets form both the player and the opponent.
  ///
  /// Calls itself every 500 milliseconds
  Future<void> _shootBullets() async {
    await Future.delayed(const Duration(milliseconds: 250));

    // Player's bullet
    final playerBulletInitialPosition = Vector2.copy(_player.position)
      ..y -= Player.radius;
    final playerBulletVelocities = [
      Vector2(0, -100),
      // Vector2(60, -80),
      // Vector2(-60, -80),
    ];
    for (final bulletVelocity in playerBulletVelocities) {
      add((Bullet(
        isMine: true,
        velocity: bulletVelocity,
        image: _playerBulletImage,
        initialPosition: playerBulletInitialPosition,
      )));
    }

    /// Opponent's bullet
    final opponentBulletInitialPosition = Vector2.copy(_opponent.position)
      ..y += Player.radius;
    final opponentBulletVelocities = [
      Vector2(0, 100),
      // Vector2(60, 80),
      // Vector2(-60, 80),
    ];
    for (final bulletVelocity in opponentBulletVelocities) {
      add((Bullet(
        isMine: false,
        velocity: bulletVelocity,
        image: _opponentBulletImage,
        initialPosition: opponentBulletInitialPosition,
      )));
    }

    _shootBullets();
  }

  void updateOpponent({required Vector2 position, required int health}) {
    _opponent.position = Vector2(size.x * position.x, size.y * position.y);
    _opponent.updateHealth(health / _initialHealthPoints);
  }

  /// Called when either the player or the opponent has run out of health points
  void endGame(bool playerWon) {
    isGameOver = true;
    onGameOver(playerWon);
  }
}
