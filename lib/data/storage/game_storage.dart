import 'package:choose_favorite_character/core/enum/game_enum.dart';
import 'package:choose_favorite_character/domain/entities/option_game_entity.dart';

// TODO: а куда это?
class GameStorage {
  final Map<GameEnum, List<OptionGameEntity>> _dataGames = {};

  void updateListOptions(GameEnum game, List<OptionGameEntity> listOptions) {
    _dataGames[game] = listOptions;
  }

  void updateOption(GameEnum game, OptionGameEntity option) {
    int index = _dataGames[game]!.indexOf(option);
    _dataGames[game]![index] = option;
  }

  bool containsGame(GameEnum game) => _dataGames.containsKey(game);

  OptionGameEntity getOption(GameEnum game, int index) =>
      _dataGames[game]![index];

  List<OptionGameEntity>? getListOptions(GameEnum game) => _dataGames[game];
  int getLength(GameEnum game) => _dataGames[game]?.length ?? 0;

  Map<GameEnum, List<OptionGameEntity>> getGame() => _dataGames;

  void addGame(GameEnum game, List<OptionGameEntity> listOptions) =>
      _dataGames[game] = listOptions;

  void removeGame(GameEnum game) => _dataGames.remove(game);

  List<GameEnum> getKeys() => _dataGames.keys.toList();
}
