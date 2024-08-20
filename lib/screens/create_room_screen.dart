import 'package:flutter/material.dart';
import 'package:tic_tac_toe/reponsive/responsive.dart';
import 'package:tic_tac_toe/resources/socket_methods.dart';
import 'package:tic_tac_toe/widgets/custom_button.dart';
import 'package:tic_tac_toe/widgets/custom_text.dart';
import 'package:tic_tac_toe/widgets/custom_text_field.dart';

class CreateRoomScreen extends StatefulWidget {
  static String routeName = '/create-room';
  const CreateRoomScreen({super.key});

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  final TextEditingController _nameContoller = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();
  @override
  void dispose() {
    super.dispose();
    _nameContoller.dispose();
  }

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
                text: 'Create Room',
                fontSize: 70,
              ),
              SizedBox(
                height: size.height * 0.008,
              ),
              CustomTextField(
                controller: _nameContoller,
                hintText: 'Room name',
              ),
              SizedBox(
                height: size.height * 0.045,
              ),
              CustomButton(
                onTap: () => _socketMethods.createRoom(_nameContoller.text.trim()),
                text: 'Create',
              )
            ],
          ),
        ),
      ),
    );
  }
}
