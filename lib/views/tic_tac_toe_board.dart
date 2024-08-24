import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/provider/room_data_provider.dart';
import 'package:tic_tac_toe/resources/socket_methods.dart';
import 'package:tic_tac_toe/utils/color.dart';

class TicTacToeBoard extends StatefulWidget {
  const TicTacToeBoard({super.key});

  @override
  State<TicTacToeBoard> createState() => _TicTacToeBoardState();
}

class _TicTacToeBoardState extends State<TicTacToeBoard> {
  final SocketMethods _socketMethods = SocketMethods();

  tapped(int index, RoomDataProvider roomDataProvider) {
    _socketMethods.tapGrid(
      index,
      roomDataProvider.roomData['_id'],
      roomDataProvider.displayItems,
    );
  }

  @override
  void initState() {
    super.initState();
    _socketMethods.tappedListener(context);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: size.height * 0.7,
        maxWidth: 500,
      ),
      child: AbsorbPointer(
        absorbing: roomDataProvider.roomData['turn']['sockedID'] !=
            _socketMethods.socketClient.id,
        child: GridView.builder(
          itemCount: 9,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemBuilder: (BuildContext context, index) {
            return GestureDetector(
              onTap: () => tapped(index, roomDataProvider),
              child: Container(
                decoration: BoxDecoration(
                  color: bgColor,
                  border: Border.all(
                    color: Colors.white24,
                  ),
                ),
                child: Center(
                  child: AnimatedSize(
                    duration: const Duration(
                      milliseconds: 200,
                    ),
                    child: Text(
                      roomDataProvider.displayItems[index],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 100,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            blurRadius: 40,
                            color: roomDataProvider.displayItems[index] == 'O'
                                ? Colors.red
                                : Colors.blue,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
