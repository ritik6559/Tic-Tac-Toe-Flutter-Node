import 'package:flutter/material.dart';
import 'package:tic_tac_toe/reponsive/responsive.dart';
import 'package:tic_tac_toe/screens/create_room_screen.dart';
import 'package:tic_tac_toe/screens/join_room_screen.dart';
import 'package:tic_tac_toe/widgets/custom_button.dart';

class MainMenuScreen extends StatelessWidget {
  static const routeName = '/main-menu';
  const MainMenuScreen({super.key});

  void navigateToCreateRoomScreen(BuildContext context) {
    Navigator.pushNamed(context, CreateRoomScreen.routeName);
  }

  void navigateToJoinRoomScreen(BuildContext context) {
    Navigator.pushNamed(context, JoinRoomScreen.routeName);
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                onTap: () => navigateToCreateRoomScreen(context),
                text: 'Create room',
              ),
              const SizedBox(height: 20),
              CustomButton(
                onTap: () => navigateToJoinRoomScreen(context),
                text: 'Join room',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
