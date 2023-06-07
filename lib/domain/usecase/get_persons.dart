import 'package:choose_favorite_character/core/use_cases/use_case.dart';
import 'package:choose_favorite_character/data/data_sources/remote_data_source.dart';
import 'package:choose_favorite_character/domain/entities/game_entity.dart';
import 'package:choose_favorite_character/domain/entities/option_game_entity.dart';
import 'package:choose_favorite_character/domain/mapper/game_mapper.dart';
import 'package:choose_favorite_character/domain/params/game_params.dart';

class GetPersons extends UseCase<GameEntity, GameParams> {
  @override
  Future<GameEntity> call(GameParams params) async {
    List<OptionGameEntity> result = (await RemoteDataSource()
            .getItems(gameEnum: params.gameEnum, count: params.countElements))
        .map(GameMapper.fromModel)
        .toList();
    result.shuffle();
    return GameEntity(title: params.gameEnum, optionsList: result);
  }
}
