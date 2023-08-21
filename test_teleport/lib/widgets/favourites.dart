import 'package:flutter/material.dart';
import 'package:test_teleport/widgets/square.dart';

class FavoritesWidgets extends StatelessWidget {
  const FavoritesWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 100,
        width: 500,
        child: Scrollbar(
          child: ListView(scrollDirection: Axis.horizontal, children: const [
            MySquare(),
            MySquare(),
            MySquare(),
            MySquare(),
          ]),
        ),
      ),
    );
  }
}
