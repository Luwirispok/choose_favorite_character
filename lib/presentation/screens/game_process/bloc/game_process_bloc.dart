import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:choose_favorite_character/core/enum/game_enum.dart';
import 'package:choose_favorite_character/data/storage/game_storage.dart';
import 'package:choose_favorite_character/domain/entities/option_game_entity.dart';
import 'package:choose_favorite_character/presentation/screens/game_process/bloc/data/options_pair.dart';

part 'game_process_event.dart';

part 'game_process_state.dart';

class GameProcessBloc extends Bloc<GameProcessEvent, GameProcessState> {
  GameProcessBloc({
    required currentGame,
    required this.gameStorage,
  }) : super(GameProcessState(
          currentGame: currentGame,
          optionsPair: OptionsPair(
            firstOption: gameStorage.getListOptions(currentGame)![0],
            secondOption: gameStorage.getListOptions(currentGame)![1],
          ),
        )) {
    on<InitEvent>(_onInitEvent);
    on<SelectedOptionEvent>(_onSelectedOptionEvent);
    add(InitEvent());
  }

  GameStorage gameStorage;

  late final List<OptionGameEntity> dataGame;
  final List<OptionGameEntity> rankingList = [];

  FutureOr<void> _onInitEvent(InitEvent event, Emitter<GameProcessState> emit) {
    dataGame = gameStorage.getListOptions(state.currentGame) ?? [];
  }

  FutureOr<void> _onSelectedOptionEvent(
      SelectedOptionEvent event, Emitter<GameProcessState> emit) {
    print(event.loser.toString());
    _addingToRankingList(event.loser);
    if (dataGame.length == 1) {
      _addingToRankingList(dataGame[0]);
      gameStorage.removeGame(state.currentGame);
      emit(state.copyWith(isGameOver: true));
      return null;
    }
    emit(state.copyWith(
      optionsPair: _choosingNewPair(),
    ));
  }

  OptionsPair _choosingNewPair() => OptionsPair(
        firstOption: dataGame![0],
        secondOption: dataGame![1],
      );

  void _addingToRankingList(OptionGameEntity loser) {
    rankingList.insert(0, loser);
    dataGame!.remove(loser);
  }
}
