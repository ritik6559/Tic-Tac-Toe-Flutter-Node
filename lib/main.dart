import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screens/main_menu_screen.dart';
import 'package:tic_tac_toe/utils/color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor
      ),
      home: const MainMenuScreen(),
      routes: {
        MainMenuScreen.routeName : (context) => const MainMenuScreen(),
      },
      initialRoute: MainMenuScreen.routeName,
    );
  }
}