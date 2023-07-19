import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tetris/piece.dart';
import 'package:tetris/pixel.dart';
import 'package:tetris/values.dart';

/*
это сетка 2на2 с нулевым значением представляющим пустое пространство
не пустое будет иметь цвет в нем чтобы показывать приземлившиеся фигуры
это сетка 2 на 2 и поэтому надо создать список внутри списка
*/

List<List<Tetromino?>> gameBoard = List.generate(
  colLenght,
  (i) => List.generate(
    rowLenght,
    (j) => null,
  ),
);
// каждая позиция будет иметь нулевое значние вначале - поможет отслеживать приземлившиеся фигуры

class GameBoard extends StatefulWidget {
  const GameBoard({super.key});

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  //current tetris piece - текущая часть тетриса
  Piece currentPiece = Piece(type: Tetromino.L);

  // current score
  int currentScore = 0;

  // game over status
  bool gameOver = false;

  @override
  void initState() {
    super.initState();
    // начало игры когда загружается приложсение
    startGame();
  }

  void startGame() {
    currentPiece.initializePiece();
// обновление частоты экрана
    Duration frameRate = const Duration(milliseconds: 400);
    gameLoop(frameRate);
  }

// game loop
  void gameLoop(Duration frameRate) {
    Timer.periodic(frameRate, (timer) {
      setState(() {
        //проверить приземление
        checkLanding();
        clearLines();
        //движение вниз
        currentPiece.movePiece(Directions.down);
      });
    });
  }

  // проверьте, нет ли столкновения в будущем положении
  // return true -> есть столкновение
  // return false -> столкновения нет
  bool checkCollision(Directions direction) {
    // Пройдитесь по каждой позиции или текущему фрагменту cne
    for (int i = 0; i < currentPiece.position.length; i++) {
      //вычислите строку и столбец текущей позиции
      int row = (currentPiece.position[i] / rowLenght).floor();
      int col = currentPiece.position[i] % rowLenght;
      //отрегулируйте строку и столбец в зависимости от направления
      if (direction == Directions.left) {
        col -= 1;
      } else if (direction == Directions.right) {
        col += 1;
      } else if (direction == Directions.down) {
        row += 1;
      }
      //проверьте, не находится ли фигура за пределами поля (либо слишком низко, либо слишком далеко влево или вправо).
      if (row >= colLenght || col < 0 || col >= rowLenght) {
        return true;
      }
    }
    return false;
    //если коллизий не обнаружено, верните значение false
  }

  void checkLanding() {
    // если вниз занято
    if (checkCollision(Directions.down)) {
      //отметим позицию как занятую на игровом поле
      for (int i = 0; i < currentPiece.position.length; i++) {
        int row = (currentPiece.position[i] / rowLenght).floor();
        int col = currentPiece.position[i] % rowLenght;
        if (row >= 0 && col >= 0) {
          gameBoard[row][col] = currentPiece.type;
        }
      }
      // как только приземлились создаем новый элемент
      createdNewPiece();
    }
  }

  void createdNewPiece() {
    // создаем сначала случайный тип фигуры каждый раз
    Random rand = Random();
    // создамем новую форму с рандомным типом
    Tetromino randomType =
        Tetromino.values[rand.nextInt(Tetromino.values.length)];
    currentPiece = Piece(type: randomType);
    currentPiece.initializePiece();
    // if (isGameOver()) {
    //   gameOver = true;
    // }
  }

  // движение влево
  void moveLeft() {
    if (!checkCollision(Directions.left)) {
      setState(() {
        currentPiece.movePiece(Directions.left);
      });
    }
  }

  // движение влево
  void moveRight() {
    if (!checkCollision(Directions.right)) {
      setState(() {
        currentPiece.movePiece(Directions.right);
      });
    }
  }

  // движение влево
  void rotatePiece() {
    setState(() {
      currentPiece.rotatePiece();
    });
  }

  void clearLines() {
    // step 1: Loop through each row of the game board from bottom to top

    for (int row = colLenght - 1; row >= 0; row--) {
      // step 2: Initialize a variable to track if the row is full

      bool rowIsFull = true;

      // step 3: Check if the row if full (all columns in the row are filled with pieces)
      for (int col = 0; col < rowLenght; col++) {
        // if there's an empty column, set rowIsFull to false and break the loop
        if (gameBoard[row][col] == null) {
          rowIsFull = false;
          break;
        }
      }
      // step 4: if the row is full, clear the row and shift rows down
      if (rowIsFull) {
        // step 5: move all rows above the cleared row down by one position
        for (int r = row; r > 0; r--) {
          // copy the above row to the current row
          gameBoard[r] = List.from(gameBoard[r - 1]);

          // step 6: set the top row to empty
          gameBoard[0] = List.generate(row, (index) => null);
          // step 7: Increase the score!
          currentScore++;
        }
      }
    }
  }

  // GAME OVER METHOD
//   bool isGameOver() {
// // check if any columns in the top row are filled
//     for (int col = 0; col < rowLenght; col++) {
//       if (gameBoard[0][col] != null) {
//         return true;
//       }

//       // / if the top row is empty, the game is not over
//       return false;
//     }
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Expanded(
              child: GridView.builder(
                  // построение сетки
                  itemCount: rowLenght * colLenght,
                  physics:
                      const NeverScrollableScrollPhysics(), // чтобы поле было статичным и не двигалось
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: rowLenght),
                  // есть специальный учебник в котором можно научиться создавать сетки - тут лишь один из примеров
                  itemBuilder: (context, index) {
                    int row = (index / rowLenght).floor();
                    int col = index % rowLenght;
                    // current piece - текущий фрагмент
                    if (currentPiece.position.contains(index)) {
                      return Pixel(
                        color: currentPiece.color,
                        child: index,
                      );
                    }
                    // landed pieces - приземлившиеся фигуры
                    else if (gameBoard[row][col] != null) {
                      final Tetromino? tetrominoType = gameBoard[row][col];
                      return Pixel(
                          color: tetrominoColors[tetrominoType], child: '');
                    }

                    // blank pixel - пустой пиксель
                    else {
                      return Pixel(
                        color: Colors.grey[900],
                        child: index,
                      );
                    }
                  }),
            ),
            // SCORE
            Text(
              'Score: $currentScore',
              style: const TextStyle(color: Colors.white),
            ),

            // управление игрой
            Padding(
              padding: const EdgeInsets.only(bottom: 10, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: moveLeft,
                      color: Colors.white,
                      icon: const Icon(Icons.arrow_back_ios_new)),
                  IconButton(
                      onPressed: rotatePiece,
                      color: Colors.white,
                      icon: const Icon(Icons.rotate_right)),
                  IconButton(
                      onPressed: moveRight,
                      color: Colors.white,
                      icon: const Icon(Icons.arrow_forward_ios)),
                ],
              ),
            )
          ],
        ));
  }
}
