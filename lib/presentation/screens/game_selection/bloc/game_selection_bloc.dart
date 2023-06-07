import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:choose_favorite_character/core/enum/game_enum.dart';
import 'package:choose_favorite_character/core/use_cases/use_case.dart';
import 'package:choose_favorite_character/data/storage/game_storage.dart';
import 'package:choose_favorite_character/domain/entities/game_entity.dart';
import 'package:choose_favorite_character/domain/params/game_params.dart';
import 'package:meta/meta.dart';

part 'game_selection_event.dart';

part 'game_selection_state.dart';

class GameSelectionBloc extends Bloc<GameSelectionEvent, GameSelectionState> {
  GameSelectionBloc({required this.getGameUseCase, required this.gameStorage})
      : super(SelectedGamesState()) {
    on<StartGameEvent>(_onStartGameEvent);
  }

  UseCase getGameUseCase;
  GameStorage gameStorage;

  Future<FutureOr<void>> _onStartGameEvent(
      StartGameEvent event, Emitter<GameSelectionState> emit) async {
    if (gameStorage.containsGame(event.nameGame)) {
      emit(ErrorGameIsNotFinished(event.nameGame));
      emit(SelectedGamesState());
      return null;
    }

    try {
      emit(GameLoadingState(event.nameGame));
      GameEntity result = await getGameUseCase(
          GameParams(gameEnum: event.nameGame, countElements: 20));
      gameStorage.addGame(event.nameGame, result.optionsList);
      emit(GameLoadedState(event.nameGame));
      log(gameStorage.getKeys().toString());
    } catch (e) {
      emit(ErrorServer(e.toString()));
    }
    emit(SelectedGamesState());
  }
}
