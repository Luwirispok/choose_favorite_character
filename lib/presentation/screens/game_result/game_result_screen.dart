import 'package:choose_favorite_character/domain/entities/game_entity.dart';
import 'package:choose_favorite_character/presentation/widgets/result_tile_custom.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GameResultScreen extends StatelessWidget {
  const GameResultScreen({Key? key, required this.game}) : super(key: key);

  final GameEntity game;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
        title: const Text('Результаты игры'),
      ),
      body: SafeArea(
        child: ListView.separated(
          itemBuilder: (context, index) => ResultTileCustom(
            title: game.optionsList[index].name,
            urlImage: game.optionsList[index].urlPicture,
          ),
          separatorBuilder: (_, __) => const SizedBox(
            height: 10,
          ),
          itemCount: game.optionsList.length,
        ),
      ),
    );
  }
}
