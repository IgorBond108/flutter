import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:test_3_pages/pages/second_screen.dart';

import 'package:math_expressions/math_expressions.dart';
import 'package:test_3_pages/pages/third_screen.dart';

import 'bloc/weather_bloc.dart';
import 'calculate/bindings/my_bindings.dart';
import 'pages/first_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WeatherBloc(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialBinding: MyBindings(),
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

int _selectedTab = 0;

List<Widget> _widgetOptions = <Widget>[
  const FirstScreen(
    title: '',
  ),
  SecondScreen(),
  ThirdScreen(
    cityName: null,
  ),
];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Navigation(),
      body: Center(
        child: _widgetOptions[_selectedTab],
      ),
    );
  }

  BottomNavigationBar Navigation() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '1 экран',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calculate),
          label: '2 экран',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.thermostat),
          label: '3 экран',
        ),
      ],
      currentIndex: _selectedTab,
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
    );
  }

  void _onItemTapped(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }
}
