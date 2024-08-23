import 'package:flutter/material.dart';
import 'package:tic_tac_toe/utils/color.dart';

class TicTacToeBoard extends StatefulWidget {
  const TicTacToeBoard({super.key});

  @override
  State<TicTacToeBoard> createState() => _TicTacToeBoardState();
}

class _TicTacToeBoardState extends State<TicTacToeBoard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: size.height * 0.7,
        maxWidth: 500,
      ),
      child: GridView.builder(
        itemCount: 9,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (BuildContext context, index) {
          return Container(
            decoration: BoxDecoration(
              color: bgColor,
              border: Border.all(
                color: Colors.white24,
              )
            ),
            child: Center(
              child: Text(
                'X',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 100,
                  color: Colors.white,
                  shadows: [
                    const Shadow(
                      blurRadius: 40,
                      color: Colors.blue,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
