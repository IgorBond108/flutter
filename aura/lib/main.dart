import 'package:flutter/material.dart';

import 'diagnostica_info.dart';
import 'loading_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DiagnosticaInfo(
          // title: '',
          ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: 900,
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset(
                'assets/fone.jpg',
              ),
            ),
          ),
          const UpText(),
          const DownButton(),
        ],
      ),
    );
  }
}

class DownButton extends StatelessWidget {
  const DownButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 550),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
              onPressed: () {},
              child: Container(
                  // decoration:  BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.yellow),
                  color: const Color.fromARGB(255, 107, 33, 243),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('ФОТО', style: TextStyle(color: Colors.white, fontSize: 22)),
                  ))),
          TextButton(
              onPressed: () {},
              child: Container(
                  color: const Color.fromARGB(255, 243, 33, 142),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('РЕЗУЛЬТАТ', style: TextStyle(color: Colors.white, fontSize: 22)),
                  ))),
        ],
      ),
    );
  }
}

class UpText extends StatelessWidget {
  const UpText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.all(25.0),
          child: Text(
            'Аура',
            style: TextStyle(color: Colors.white, fontSize: 60),
          ),
        ),
        //переход на другую страницу с информацией
        TextButton(
            onPressed: () {
              ImageInsert();
            },
            child: const Text(
              'Диагностика заболеваний',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ))
      ],
    );
  }
}
