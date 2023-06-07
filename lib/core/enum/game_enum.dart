enum GameEnum { rickAndMorty, meme, anime }

extension GameExtension on GameEnum {
  String get name {
    switch (this) {
      case GameEnum.rickAndMorty:
        return 'Rick and Morty';
      case GameEnum.meme:
        return 'Мемы';
      case GameEnum.anime:
        return 'Аниме';
    }
  }
}
