import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(TetrisGameApp());
}

class TetrisGameApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tetris Game'),
        ),
        body: TetrisGame(),
      ),
    );
  }
}

class TetrisGame extends StatefulWidget {
  @override
  _TetrisGameState createState() => _TetrisGameState();
}

class _TetrisGameState extends State<TetrisGame> {
  late List<List<int>> grid;
  late List<List<int>> currentShape;
  late int currentShapeX;
  late int currentShapeY;

  // List of different Tetromino shapes
  final List<List<List<int>>> tetrominoShapes = [
    // I
    [
      [1, 1, 1, 1],
    ],
    // J
    [
      [1, 0, 0],
      [1, 1, 1],
    ],
    // L
    [
      [0, 0, 1],
      [1, 1, 1],
    ],
    // O
    [
      [1, 1],
      [1, 1],
    ],
    // S
    [
      [0, 1, 1],
      [1, 1, 0],
    ],
    // T
    [
      [0, 1, 0],
      [1, 1, 1],
    ],
    // Z
    [
      [1, 1, 0],
      [0, 1, 1],
    ],
  ];

  @override
  void initState() {
    super.initState();
    _initGame();
  }

  void _initGame() {
    grid = List.generate(20, (index) => List.generate(10, (index) => 0));
    _generateNewShape();
  }

  void _generateNewShape() {
    final random = Random();
    final shapeIndex = random.nextInt(tetrominoShapes.length);
    currentShape = tetrominoShapes[shapeIndex];
    currentShapeX =
        (10 - currentShape[0].length) ~/ 2; // Center the shape horizontally
    currentShapeY = 0;
  }

  void moveLeft() {
    setState(() {
      if (!_isColliding(currentShapeX - 1, currentShapeY, currentShape)) {
        currentShapeX--;
      }
    });
  }

  void moveRight() {
    setState(() {
      if (!_isColliding(currentShapeX + 1, currentShapeY, currentShape)) {
        currentShapeX++;
      }
    });
  }

  void rotate() {
    setState(() {
      final rotatedShape = _rotateShape(currentShape);
      if (!_isColliding(currentShapeX, currentShapeY, rotatedShape)) {
        currentShape = rotatedShape;
      }
    });
  }

  bool _isColliding(int x, int y, List<List<int>> shape) {
    for (int row = 0; row < shape.length; row++) {
      for (int col = 0; col < shape[row].length; col++) {
        if (shape[row][col] == 1) {
          final gridRow = y + row;
          final gridCol = x + col;

          if (gridRow >= 0 &&
              gridRow < grid.length &&
              gridCol >= 0 &&
              gridCol < grid[0].length) {
            if (grid[gridRow][gridCol] == 1) {
              return true; // Collision detected
            }
          } else {
            return true; // Collision with boundary
          }
        }
      }
    }
    return false; // No collision
  }

  List<List<int>> _rotateShape(List<List<int>> shape) {
    final newShape =
        List.generate(shape[0].length, (index) => List.filled(shape.length, 0));

    for (int row = 0; row < shape.length; row++) {
      for (int col = 0; col < shape[row].length; col++) {
        newShape[col][shape.length - row - 1] = shape[row][col];
      }
    }
    return newShape;
  }

  void _updateGame() {
    if (!_isColliding(currentShapeX, currentShapeY + 1, currentShape)) {
      setState(() {
        currentShapeY++;
      });
    } else {
      _placeCurrentShapeInGrid();
      _checkCompletedRows();
      _generateNewShape();
      if (_isColliding(currentShapeX, currentShapeY, currentShape)) {
        _gameOver();
      }
    }
  }

  void _placeCurrentShapeInGrid() {
    for (int row = 0; row < currentShape.length; row++) {
      for (int col = 0; col < currentShape[row].length; col++) {
        if (currentShape[row][col] == 1) {
          final gridRow = currentShapeY + row;
          final gridCol = currentShapeX + col;

          if (gridRow >= 0 &&
              gridRow < grid.length &&
              gridCol >= 0 &&
              gridCol < grid[0].length) {
            grid[gridRow][gridCol] = 1;
          }
        }
      }
    }
  }

  void _checkCompletedRows() {
    for (int row = grid.length - 1; row >= 0; row--) {
      bool isRowCompleted = true;
      for (int col = 0; col < grid[row].length; col++) {
        if (grid[row][col] == 0) {
          isRowCompleted = false;
          break;
        }
      }
      if (isRowCompleted) {
        _removeRow(row);
      }
    }
  }

  void _removeRow(int rowIndex) {
    grid.removeAt(rowIndex);
    grid.insert(0, List.generate(10, (index) => 0));
  }

  void _gameOver() {
    // Implement game over logic here
    print('Game Over');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            itemCount: 200,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 10,
            ),
            itemBuilder: (ctx, index) {
              final row = index ~/ 10;
              final col = index % 10;
              return Container(
                decoration: BoxDecoration(
                  color: grid[row][col] == 1 ? Colors.blue : null,
                  border: Border.all(),
                ),
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: moveLeft,
              child: const Text('Left'),
            ),
            ElevatedButton(
              onPressed: moveRight,
              child: const Text('Right'),
            ),
            ElevatedButton(
              onPressed: rotate,
              child: const Text('Rotate'),
            ),
          ],
        ),
      ],
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Start updating the game at regular intervals
    Timer.periodic(const Duration(milliseconds: 500), (_) => _updateGame());
  }
}
