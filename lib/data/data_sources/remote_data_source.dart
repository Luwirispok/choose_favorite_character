import 'package:choose_favorite_character/core/enum/game_enum.dart';
import 'package:choose_favorite_character/data/api_helper.dart';
import 'package:choose_favorite_character/data/dto/option_game_dto.dart';
import 'package:choose_favorite_character/data/mappers/game_model_mapper.dart';

class RemoteDataSource {
  Future<List<OptionGameDto>> getItems(
      {required GameEnum gameEnum, required int count}) async {
    dynamic result = await ApiRequest.getApiHelper(_getUrl(gameEnum));
    return _getSettingsForMapper(gameEnum)
        .jsonToModel(result)
        .take(count)
        .toList();
  }

  MapperToGameModel _getSettingsForMapper(GameEnum gameEnum) {
    switch (gameEnum) {
      case GameEnum.rickAndMorty:
        return MapperToGameModel(
            sendListOfItems: (json) => json['results'],
            sendNameOfItem: (Map<String, dynamic> item) => item['name'],
            sendUrlPictureOfItem: (Map<String, dynamic> item) => item['image']);
      case GameEnum.meme:
        return MapperToGameModel(
            sendListOfItems: (json) => json['data']['memes'],
            sendNameOfItem: (Map<String, dynamic> item) => item['name'],
            sendUrlPictureOfItem: (Map<String, dynamic> item) => item['url']);
      case GameEnum.anime:
        return MapperToGameModel(
            sendListOfItems: (json) => json['data'],
            sendNameOfItem: (Map<String, dynamic> item) =>
                item['attributes']['titles']['en_jp'],
            sendUrlPictureOfItem: (Map<String, dynamic> item) =>
                item['attributes']['posterImage']['large']);
    }
  }

  String _getUrl(GameEnum gameEnum) {
    switch (gameEnum) {
      case GameEnum.rickAndMorty:
        return 'https://rickandmortyapi.com/api/character';
      case GameEnum.meme:
        return 'https://api.imgflip.com/get_memes';
      case GameEnum.anime:
        return 'https://kitsu.io/api/edge/anime';
    }
  }
}
