part of 'game_selection_bloc.dart';

@immutable
abstract class GameSelectionEvent {}

class StartGameEvent extends GameSelectionEvent {
  final GameEnum nameGame;

  StartGameEvent({required this.nameGame});
}
