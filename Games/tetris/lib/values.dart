// рамки границ стобцы и строки
import 'dart:ui';

int rowLenght = 10;
int colLenght = 15;

enum Directions {
  left,
  right,
  down,
}

enum Tetromino {
  // перечисление разных типов фигуров - тип части в виде списка

  L,
  J,
  I,
  O,
  S,
  Z,
  T,

/*

O
O
O O

  O
  O
O O

O
O
O
O

O O
O O

  0 0
0 0

0 0
  0 0

0
0 0
0
*/
}

const Map<Tetromino, Color> tetrominoColors = {
  Tetromino.L: Color.fromARGB(255, 228, 162, 30), // Orange
  Tetromino.J: Color.fromARGB(255, 0, 102, 255), // Blue
  Tetromino.I: Color.fromARGB(255, 247, 37, 149), // Pink
  Tetromino.S: Color.fromARGB(255, 247, 247, 37),
  Tetromino.O: Color.fromARGB(255, 8, 154, 25),
  Tetromino.Z: Color.fromARGB(255, 247, 37, 37), // Red
  Tetromino.T: Color.fromARGB(255, 144, 0, 255),
};
