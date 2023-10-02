import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // hintColor: Colors.black,
        // hoverColor: Colors.black,
        // indicatorColor: Colors.black,
        // primaryColor: Colors.black,
        // primaryColorDark: Colors.black,
        // primaryColorLight: Colors.black,
        primarySwatch: Colors.yellow,
        scaffoldBackgroundColor: Colors.black,
        // secondaryHeaderColor: Colors.black,
        // shadowColor: Colors.black,
        // splashColor: Colors.black,
      ),
      home: const MyHomePage(title: 'Who is'),
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
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Text('Пожалуйста введите свою дату рождения:',
                textAlign: TextAlign.center,
                overflow: TextOverflow.fade,
                selectionColor: Colors.red,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                )),
            TextField(
                maxLength: 8,
                maxLines: 1,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  // errorText: 'ERROR',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 5,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 10,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.yellow,
                      width: 5,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  // enabled: false,
                ),
                style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
