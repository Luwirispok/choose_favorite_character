part of 'game_process_bloc.dart';

abstract class GameProcessEvent {}

class InitEvent extends GameProcessEvent {}

class SelectedOptionEvent extends GameProcessEvent {
  final OptionGameEntity loser;

  SelectedOptionEvent(this.loser);
}
