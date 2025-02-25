import 'package:flutter/material.dart';

import 'core/di/injection.dart';
import 'core/navigation/app_router.dart';

void main() {
  addInjection();
  runApp(const YouTubeTest());
}

class YouTubeTest extends StatelessWidget {
  const YouTubeTest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router.config(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
        ),
      ),
    );
  }
}
