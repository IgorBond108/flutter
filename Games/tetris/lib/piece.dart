// важнейшая часть урока здесь
import 'dart:ui';

import 'package:tetris/board.dart';
import 'package:tetris/values.dart';

class Piece {
  // типы фрагментов
  Tetromino type;

  Piece({required this.type}); // обязательно видеть тип объекта тетриса

  // фрагмент - это просто список целых чисел
  List<int> position = [];

  // цвета элементов
  Color get color {
    return tetrominoColors[type] ?? const Color.fromARGB(255, 255, 255, 255);
    // Default to white if no color is found
  }

  // как только узнали что за тип - генерируем целые числа

  void initializePiece() {
    // называем инициализация фрагментов
    switch (type) {
      case Tetromino.L: // Буква Л
        position = [
          -7,
          -6,
          -5,
          -4,
          -3,
        ];
        break;
      case Tetromino.J:
        position = [
          -25,
          -15,
          -5,
          -6,
        ];
        break;
      case Tetromino.I:
        position = [
          -4,
          -5,
          -6,
          -7,
        ];
        break;
      case Tetromino.O: // Буква Л
        position = [
          -15,
          -16,
          -5,
          -6,
        ];
        break;
      case Tetromino.S: // Буква Л
        position = [
          -15,
          -14,
          -6,
          -5,
        ];
        break;
      case Tetromino.Z: // Буква Л
        position = [
          -17,
          -16,
          -6,
          -5,
        ];
        break;
      case Tetromino.T: // Буква Л
        position = [
          -26,
          -16,
          -6,
          -15,
        ];
        break;
      default:
    }
  }

/*
создаем метод движущейся части
*/
  void movePiece(Directions directions) {
    switch (directions) {
      case Directions.down:
        for (int i = 0; i < position.length; i++) {
          position[i] += rowLenght;
        }
        break;
      case Directions.left:
        for (int i = 0; i < position.length; i++) {
          position[i] -= 1;
        }
        break;
      case Directions.right:
        for (int i = 0; i < position.length; i++) {
          position[i] += 1;
        }
        break;
      default:
    }
  }

  // вращение предмета
  int rotationState = 1;
  void rotatePiece() {
    // новая позиция
    List<int> newPosition = [];
    // поверните деталь в зависимости от ее типа
    switch (type) {
      case Tetromino.L:
        switch (rotationState) {
          case 0:
/*

O
O
O O

*/
// get the new position
            newPosition = [
              position[1] - rowLenght,
              position[1],
              position[1] + rowLenght,
              position[1] + rowLenght + 1
            ];
            if (piecePositionIsValid(newPosition)) {
              // update position
              position = newPosition;
// update rotation state
              rotationState = (rotationState + 1) % 4;
            }
            break;

          case 1:
            newPosition = [
              position[1] - 1,
              position[1],
              position[1] + 1,
              position[1] + rowLenght - 1
            ];
            if (piecePositionIsValid(newPosition)) {
              // update position
              position = newPosition;
// update rotation state
              rotationState = (rotationState + 1) % 4;
            }
            break;

          case 2:
            newPosition = [
              position[1] + rowLenght,
              position[1],
              position[1] - rowLenght,
              position[1] - rowLenght - 1
            ];
            if (piecePositionIsValid(newPosition)) {
              // update position
              position = newPosition;
// update rotation state
              rotationState = (rotationState + 1) % 4;
            }
            break;

          case 3:
            newPosition = [
              position[1] - rowLenght + 1,
              position[1],
              position[1] + 1,
              position[1] - 1
            ];
            if (piecePositionIsValid(newPosition)) {
              // update position
              position = newPosition;
// update rotation state
              rotationState = (rotationState + 1) % 4;
            }
            break;
        }

        break;
      default:
    }
  }

  // check if valid position
  bool positionIsValid(int position) {
// get the row and col of position
    int row = (position / rowLenght).floor();
    int col = position % rowLenght;
// if the position is taken, return false
    if (row < 0 || col < 0 || gameBoard[row][col] != null) {
      return false;
    }
// otherwise position is valid so return true
    else {
      return true;
    }
  }

// check if piece is valid position
  bool piecePositionIsValid(List<int> piecePosition) {
    bool firstCol0ccupied = false;
    bool lastColOccupied = false;

    for (int pos in piecePosition) {
// return false if any position is already taken
      if (!positionIsValid(pos)) {
        return false;
      }
// get the col of position
      int col = pos % rowLenght;
// check if the first or last column is occupied
      if (col == 0) {
        firstCol0ccupied = true;
      }
      if (col == rowLenght - 1) {
        lastColOccupied = true;
      }
    }

// if there is a piece in the first col and last col, it is going through the wall
    return !(firstCol0ccupied && lastColOccupied);
  }
}
