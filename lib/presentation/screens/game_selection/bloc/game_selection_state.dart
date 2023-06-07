part of 'game_selection_bloc.dart';

abstract class GameSelectionState {}

class SelectedGamesState extends GameSelectionState {}

class GameLoadingState extends GameSelectionState {
  final GameEnum game;

  GameLoadingState(this.game);
}

class GameLoadedState extends GameSelectionState {
  final GameEnum game;

  GameLoadedState(this.game);
}

class ErrorServer extends GameSelectionState {
  final String message;

  ErrorServer(this.message);
}

class ErrorGameIsNotFinished extends GameSelectionState {
  final GameEnum game;

  ErrorGameIsNotFinished(this.game);
}
