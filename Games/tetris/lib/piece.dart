// важнейшая часть урока здесь
import 'package:tetris/values.dart';

class Piece {
  // типы фрагментов
  Tetromino type;

  Piece({required this.type}); // обязательно видеть тип объекта тетриса

  // фрагмент - это просто список целых чисел
  List<int> position = [];
  // как только узнали что за тип - генерируем целые числа

  void initializePiece() {
    // называем инициализация фрагментов
    switch (type) {
      case Tetromino.L: // Буква Л
        position = [
          4,
          14,
          24,
          25,
        ];
        break;
      default:
    }
  }
}
