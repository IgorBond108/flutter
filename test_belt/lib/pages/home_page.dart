import 'dart:typed_data';
import 'package:test_belt/main.dart';
import 'package:flutter/material.dart';
import 'package:bitmap/bitmap.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white70,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                '+14 °C',
                style: TextStyle(color: Color.fromARGB(255, 1, 75, 112)),
              ),
              IconButton(
                icon: Image.asset(
                    '/Users/admin/Documents/GitHub/flutter-app/test_belt/assets/icons/weather.png',
                    width: 90,
                    height: 90),
                onPressed: () {},
              ),
              Text(
                '4 октября',
                style: TextStyle(color: Color.fromARGB(255, 1, 75, 112)),
              )
            ],
          )
          // const TextAppBar(),
          ),
      backgroundColor: Colors.white,
      body: Column(
        children: const [
          // Image.memory(headedBitmap),
          SizedBox(
            height: 40,
          ),
          TextWidget(),
        ],
      ),
    );
  }
}

class TextAppBar extends StatelessWidget {
  const TextAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'BELT',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Да начнется битва',
        style: TextStyle(fontSize: 30, fontStyle: FontStyle.normal),
      ),
    );
  }
}
