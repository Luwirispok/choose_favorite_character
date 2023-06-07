import 'package:choose_favorite_character/core/enum/game_enum.dart';
import 'package:choose_favorite_character/domain/entities/game_entity.dart';
import 'package:choose_favorite_character/presentation/screens/game_process/bloc/game_process_bloc.dart';
import 'package:choose_favorite_character/presentation/widgets/option_tile_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class GameProcessScreen extends StatelessWidget {
  const GameProcessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<GameProcessBloc, GameProcessState>(
      listener: (context, state) {
        if (state.error) {
          ShowErrorDialog(context: context).call();
        }
        if (state.isGameOver) {
          context.go(
            '/game_selection/game_result',
            extra: GameEntity(
              title: state.currentGame,
              optionsList: context.read<GameProcessBloc>().rankingList,
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.read<GameProcessBloc>().state.currentGame.name),
        ),
        body: SafeArea(
          child: BlocBuilder<GameProcessBloc, GameProcessState>(
            buildWhen: (previous, current) =>
                previous.optionsPair != current.optionsPair,
            builder: (context, state) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: Column(
                  children: [
                    OptionTileCustom(
                      title: state.optionsPair.firstOption.name,
                      urlImage: state.optionsPair.firstOption.urlPicture,
                      onTap: () {
                        context.read<GameProcessBloc>().add(SelectedOptionEvent(
                            state.optionsPair.secondOption));
                      },
                    ),
                    const OptionSeparatorCustom(),
                    OptionTileCustom(
                      onTap: () {
                        context.read<GameProcessBloc>().add(
                            SelectedOptionEvent(state.optionsPair.firstOption));
                      },
                      title: state.optionsPair.secondOption.name,
                      urlImage: state.optionsPair.secondOption.urlPicture,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class OptionSeparatorCustom extends StatelessWidget {
  const OptionSeparatorCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Flexible(flex: 1, child: Divider(color: Colors.white, height: 1)),
          Text('  VS  '),
          Flexible(flex: 1, child: Divider(color: Colors.white, height: 1)),
        ],
      ),
    );
  }
}

class ShowErrorDialog {
  final BuildContext context;

  ShowErrorDialog({required this.context});

  void call() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Игра сломалась :('),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Вернуться'),
          ),
        ],
      ),
    );
  }
}
