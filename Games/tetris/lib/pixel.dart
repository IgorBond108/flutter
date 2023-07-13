import 'package:flutter/material.dart';

class Pixel extends StatelessWidget {
  var color;
  var child;
  Pixel({super.key, required this.color, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius:
              BorderRadius.circular(4), //кружки в точках пересечения линиц
        ),
        margin: const EdgeInsets.all(1), // наборы границ - сетка
        child: Center(
          child: Text(
            child
                .toString(), // приводим данные в строку и пронумеровываем список
            style: const TextStyle(color: Colors.white),
          ),
        ));
  }
}
