import 'package:flutter/material.dart';
import 'dart:async';

import 'SecondScreenInputtDataAndPhoto.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double visible = 1.0;

  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => InfoAboutZakaz(
                    title: '',
                  )));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IgnorePointer(
              child: AnimatedOpacity(
                opacity: 1.0,
                duration: const Duration(milliseconds: 2500),
                child: Image.asset('assets/images/logo.jpg'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
