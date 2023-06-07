import 'package:choose_favorite_character/data/dto/option_game_dto.dart';
import 'package:choose_favorite_character/domain/entities/option_game_entity.dart';

class GameMapper {
  static OptionGameEntity fromModel(OptionGameDto optionGameDto) =>
      OptionGameEntity(
        name: optionGameDto.name,
        urlPicture: optionGameDto.urlPicture,
      );
}
