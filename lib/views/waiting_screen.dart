import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/provider/room_data_provider.dart';
import 'package:tic_tac_toe/widgets/custom_text_field.dart';

class WaitingScreen extends StatefulWidget {
  const WaitingScreen({super.key});

  @override
  State<WaitingScreen> createState() => _WaitingScreenState();
}

class _WaitingScreenState extends State<WaitingScreen> {
  late TextEditingController roomIdController;

  @override
  void initState() {
    super.initState();
    roomIdController = TextEditingController(
      text:
          Provider.of<RoomDataProvider>(context, listen: false).roomData['_id'],
    );
  }

  @override
  void dispose() {
    roomIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Waiting for a player to join......'),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10,
          ),
          child: CustomTextField(
            controller: roomIdController,
            hintText: '',
            isReadOnly: true,
          ),
        ),
      ],
    );
  }
}
