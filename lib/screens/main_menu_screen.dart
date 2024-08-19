import 'package:flutter/material.dart';
import 'package:tic_tac_toe/reponsive/responsive.dart';
import 'package:tic_tac_toe/widgets/custom_button.dart';

class MainMenuScreen extends StatelessWidget {
  static const routeName = '/route-menu';
  const MainMenuScreen({super.key});

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
                onTap: () {},
                text: 'Create room',
              ),
              const SizedBox(height: 20),
              CustomButton(
                onTap: () {},
                text: 'Join room',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
