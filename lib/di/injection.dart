import 'package:choose_favorite_character/core/enum/game_enum.dart';
import 'package:choose_favorite_character/core/use_cases/use_case.dart';
import 'package:choose_favorite_character/data/data_sources/remote_data_source.dart';
import 'package:choose_favorite_character/data/storage/game_storage.dart';
import 'package:choose_favorite_character/domain/usecase/get_persons.dart';
import 'package:choose_favorite_character/presentation/screens/game_process/bloc/game_process_bloc.dart';
import 'package:choose_favorite_character/presentation/screens/game_selection/bloc/game_selection_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class Locator {
  static final injection = GetIt.I;

  static Future<void> init() async {
    injection.registerFactory<GameSelectionBloc>(() => GameSelectionBloc(
          getGameUseCase: injection(),
          gameStorage: injection(),
        ));
    injection.registerFactoryParam<GameProcessBloc, GameEnum, void>(
        (game, _) => GameProcessBloc(
              gameStorage: injection(),
              currentGame: game,
            ));

    injection.registerLazySingleton<UseCase>(() => GetPersons());

    injection.registerLazySingleton<RemoteDataSource>(() => RemoteDataSource());
    injection.registerLazySingleton<GameStorage>(() => GameStorage());

    injection.registerLazySingleton(() => Dio());
  }
}
