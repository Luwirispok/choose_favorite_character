import 'package:choose_favorite_character/di/injection.dart';
import 'package:flutter/material.dart';
import 'presentation/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Locator.init();
  runApp(const App());
}
