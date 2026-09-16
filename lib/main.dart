import 'package:flutter/material.dart';

import 'screens/ai_login_required_screen.dart';
import 'screens/assistant_screen.dart';
import 'screens/controller_beta_screen.dart';
import 'screens/controller_full_screen.dart';
import 'screens/library_screen.dart';
import 'screens/library_full_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/settings_full_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MixGo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF020609),
        fontFamily: 'Arial',
      ),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        ControllerBetaScreen.routeName: (_) => const ControllerBetaScreen(),
        ControllerFullScreen.routeName: (_) => const ControllerFullScreen(),
        AssistantScreen.routeName: (_) => const AssistantScreen(),
        LibraryFullScreen.routeName: (_) => const LibraryFullScreen(),
        AiLoginRequiredScreen.routeName: (_) => const AiLoginRequiredScreen(),
        LibraryScreen.routeName: (_) => const LibraryScreen(),
        LoginScreen.routeName: (_) => const LoginScreen(),
        SignupScreen.routeName: (_) => const SignupScreen(),
        SettingsScreen.routeName: (_) => const SettingsScreen(),
        SettingsFullScreen.routeName: (_) => const SettingsFullScreen(),
      },
    );
  }
}
