import 'package:choose_favorite_character/di/injection.dart';
import 'package:choose_favorite_character/domain/entities/game_entity.dart';
import 'package:choose_favorite_character/presentation/screens/game_process/bloc/game_process_bloc.dart';
import 'package:choose_favorite_character/presentation/screens/game_process/game_process_screen.dart';
import 'package:choose_favorite_character/presentation/screens/game_result/game_result_screen.dart';
import 'package:choose_favorite_character/presentation/screens/game_selection/game_selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'enum/game_enum.dart';

class AppRouter {
  GoRouter get router => _goRouter;

  final GoRouter _goRouter = GoRouter(
    initialLocation: '/game_selection',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/game_selection',
        builder: (context, state) => const GameSelectionScreen(),
        routes: [
          GoRoute(
            path: 'game_process',
            builder: (context, state) => BlocProvider<GameProcessBloc>(
              create: (context) => Locator.injection<GameProcessBloc>(
                  param1: state.extra as GameEnum),
              child: const GameProcessScreen(),
            ),
          ),
          GoRoute(
            path: 'game_result',
            builder: (context, state) => GameResultScreen(
              game: state.extra as GameEntity,
            ),
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => ErrorPage(error: state.error.toString()),
  );
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key, required this.error}) : super(key: key);

  final String error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(error),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.go('/game_selection');
              },
              child: const Text('Вернуться на главный экран'),
            )
          ],
        ),
      ),
    );
  }
}
