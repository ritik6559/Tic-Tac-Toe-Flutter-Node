import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/provider/room_data_provider.dart';
import 'package:tic_tac_toe/resources/socket_client.dart';
import 'package:tic_tac_toe/screens/game_screen.dart';
import 'package:tic_tac_toe/utils/utils.dart';

class SocketMethods {
  final _socketClient = SocketClient.instance.socket!;

  // EMITS
  void createRoom(String nickname) {
    if (nickname.isNotEmpty) {
      _socketClient.emit('createRoom', {
        'nickname': nickname,
      });
    }
  }

  void joinRoom(String nickname, String roomId) {
    if (nickname.isNotEmpty && roomId.isNotEmpty) {
      _socketClient.emit('joinRoom', {
        'nickname': nickname,
        'roomId': roomId,
      });
    }
  }

  // LISTENER

  void createRoomSuccessListener(BuildContext context) {
    _socketClient.on('createdRoomSuccess', (room) {
      context.read<RoomDataProvider>().updateRoomData(room);
      Navigator.pushNamed(
        context,
        GameScreen.routeName,
      );
    });
  }

  void joinRoomSuccessListener(BuildContext context) {
    _socketClient.on('joinRoomSuccess', (room) {
      context.read<RoomDataProvider>().updateRoomData(room);
      Navigator.pushNamed(
        context,
        GameScreen.routeName,
      );
    });
  }

  void errorOccuredListener(BuildContext context) {
    _socketClient.on('errorOccurred', (data) {
      showSnackBar(
        context,
        data,
      );
    });
  }
}
