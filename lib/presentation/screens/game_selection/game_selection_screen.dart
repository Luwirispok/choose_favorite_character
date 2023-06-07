import 'package:choose_favorite_character/core/enum/game_enum.dart';
import 'package:choose_favorite_character/presentation/screens/game_selection/bloc/game_selection_bloc.dart';
import 'package:choose_favorite_character/presentation/widgets/game_tile_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class GameSelectionScreen extends StatelessWidget {
  const GameSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<GameSelectionBloc, GameSelectionState>(
      listener: (context, state) {
        if (state is ErrorServer) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
        if (state is ErrorGameIsNotFinished) {
          showDialog(
              context: context,
              builder: (BuildContext context) =>
                  GameIsNotFinishedShowDialog(game: state.game));
        }
        if (state is GameLoadedState) {
          context.go('/game_selection/game_process', extra: state.game);
          // Navigator.pushNamed(context, 'game_process', arguments: state.game);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
          ),
          backgroundColor: Colors.black12,
          title: const Text('Царь горы'),
        ),
        body: SafeArea(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            itemCount: GameEnum.values.length,
            itemBuilder: (context, index) =>
                BlocBuilder<GameSelectionBloc, GameSelectionState>(
              builder: (context, state) {
                bool loading = state is GameLoadingState &&
                    state.game == GameEnum.values[index];
                return GameTileCustom(
                  loading: loading,
                  title: GameEnum.values[index].name,
                  onTap: () {
                    context
                        .read<GameSelectionBloc>()
                        .add(StartGameEvent(nameGame: GameEnum.values[index]));
                  },
                );
              },
            ),
            separatorBuilder: (_, __) => const SizedBox(height: 10),
          ),
        ),
      ),
    );
  }
}

class GameIsNotFinishedShowDialog extends StatelessWidget {
  const GameIsNotFinishedShowDialog({Key? key, required this.game})
      : super(key: key);

  final GameEnum game;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Игра уже начата'),
      content: const Text('Вы хотите продолжить игру?'),
      actions: <Widget>[
        TextButton(
          onPressed: () => context.pop(),
          child: const Text('Нет'),
        ),
        TextButton(
          onPressed: () {
            context.pop();
            context.go('/game_selection/game_process', extra: game);
            // Navigator.pushNamed(context, '/game_process', arguments: game);
          },
          child: const Text('Да'),
        ),
      ],
    );
  }
}
