import 'package:choose_favorite_character/data/dto/option_game_dto.dart';

class MapperToGameModel {
  /// Вернуть путь к списку с элементами
  final List<dynamic> Function(dynamic json) _sendListOfItems;

  /// Вернуть путь к имени для отдельного элемента
  final String Function(Map<String, dynamic> item) _sendNameOfItem;

  /// Вернуть путь к ссылки на картинку для отдельного элемента
  final String Function(Map<String, dynamic> item) _sendUrlPictureOfItem;

  MapperToGameModel({
    required List<dynamic> Function(dynamic) sendListOfItems,
    required String Function(Map<String, dynamic>) sendNameOfItem,
    required String Function(Map<String, dynamic>) sendUrlPictureOfItem,
  })  : _sendUrlPictureOfItem = sendUrlPictureOfItem,
        _sendNameOfItem = sendNameOfItem,
        _sendListOfItems = sendListOfItems;

  List<OptionGameDto> jsonToModel(dynamic dataJson) {
    return _sendListOfItems(dataJson)
        .map((item) => OptionGameDto(
              name: _sendNameOfItem(item),
              urlPicture: _sendUrlPictureOfItem(item),
            ))
        .toList();
  }
}
