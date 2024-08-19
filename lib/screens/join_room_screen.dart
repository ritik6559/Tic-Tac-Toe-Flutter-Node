import 'package:flutter/material.dart';
import 'package:tic_tac_toe/reponsive/responsive.dart';
import 'package:tic_tac_toe/widgets/custom_button.dart';
import 'package:tic_tac_toe/widgets/custom_text.dart';
import 'package:tic_tac_toe/widgets/custom_text_field.dart';

class JoinRoomScreen extends StatefulWidget {
  static String routeName = '/join-room';
  const JoinRoomScreen({super.key});

  @override
  State<JoinRoomScreen> createState() => _JoinRoomScreenState();
}

class _JoinRoomScreenState extends State<JoinRoomScreen> {
  final TextEditingController _nameContoller = TextEditingController();
  final TextEditingController _idContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomText(
                shadows: [
                  Shadow(
                    blurRadius: 40,
                    color: Colors.blue,
                  )
                ],
                text: 'Join Room',
                fontSize: 80,
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              CustomTextField(
                controller: _nameContoller,
                hintText: 'Room name',
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              CustomTextField(
                controller: _idContoller,
                hintText: 'Room id',
              ),
              SizedBox(
                height: size.height * 0.045,
              ),
              CustomButton(
                onTap: () {},
                text: 'Join',
              )
            ],
          ),
        ),
      ),
    );
  }
}
