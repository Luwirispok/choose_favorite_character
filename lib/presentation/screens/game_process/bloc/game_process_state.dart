part of 'game_process_bloc.dart';

class GameProcessState {
  // final int maxScope;
  // final int currentMaxScope;
  final OptionGameEntity? selectedOption;
  final GameEnum currentGame;
  final OptionsPair optionsPair;
  final bool isGameOver;
  final bool error;

  GameProcessState({
    required this.optionsPair,
    // this.maxScope = -1,
    // this.currentMaxScope = 0,
    this.selectedOption,
    required this.currentGame,
    this.error = false,
    this.isGameOver = false,
  });

  GameProcessState copyWith({
    // int? maxScope,
    // int? currentMaxScope,
    OptionGameEntity? selectedOption,
    GameEnum? currentGame,
    OptionsPair? optionsPair,
    bool? isGameOver,
    bool? error,
  }) {
    return GameProcessState(
      // maxScope: maxScope ?? this.maxScope,
      // currentMaxScope: currentMaxScope ?? this.currentMaxScope,
      selectedOption: selectedOption ?? this.selectedOption,
      currentGame: currentGame ?? this.currentGame,
      optionsPair: optionsPair ?? this.optionsPair,
      isGameOver: isGameOver ?? this.isGameOver,
      error: error ?? this.error,
    );
  }
}
