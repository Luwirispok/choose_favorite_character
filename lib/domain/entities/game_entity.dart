import 'package:choose_favorite_character/core/enum/game_enum.dart';
import 'package:choose_favorite_character/domain/entities/option_game_entity.dart';

class GameEntity {
  final GameEnum title;
  final List<OptionGameEntity> optionsList;

  GameEntity({
    required this.title,
    required this.optionsList,
  });
}
