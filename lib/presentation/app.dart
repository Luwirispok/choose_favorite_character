import 'package:choose_favorite_character/core/router.dart';
import 'package:choose_favorite_character/di/injection.dart';
import 'package:choose_favorite_character/presentation/screens/game_selection/bloc/game_selection_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GameSelectionBloc>(
          create: (context) => Locator.injection<GameSelectionBloc>(),
        ),
      ],
      child: MaterialApp.router(
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.green, brightness: Brightness.dark),
        ),
        routerConfig: AppRouter().router,
      ),
    );
  }
}
