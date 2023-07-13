import 'package:flutter/material.dart';
import 'package:tetris/piece.dart';
import 'package:tetris/pixel.dart';
import 'package:tetris/values.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({super.key});

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  // рамки границ стобцы и строки
  int rowLenght = 10;
  int colLenght = 15;

  //current tetris piece - текущая часть тетриса
  Piece currentPiece = Piece(type: Tetromino.L);

  @override
  void initState() {
    super.initState();
    // начало игры когда загружается приложение
    startGame();
  }

  void startGame() {
    currentPiece.initializePiece();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: GridView.builder(
            // построение сетки
            itemCount: rowLenght * colLenght,
            physics:
                const NeverScrollableScrollPhysics(), // чтобы поле было статичным и не двигалось
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: rowLenght),
            itemBuilder: (context, index) {
              if (currentPiece.position.contains(index)) {
                return Pixel(
                  color: Colors.yellow,
                  child: index,
                );
              } else {
                return Pixel(
                  color: Colors.grey[900],
                  child: index,
                );
              }
            }));
  }
}
