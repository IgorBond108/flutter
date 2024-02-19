import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sindbad/bloc/cart/bloc.dart';
import 'package:sindbad/bloc/cart/event.dart';
import 'package:sindbad/bloc/category/bloc.dart';
import 'package:sindbad/bloc/category/event.dart';
import 'package:sindbad/bloc/home/bloc.dart';
import 'package:sindbad/bloc/home/event.dart';
import 'package:sindbad/ui/pages/auth/auth.dart';
import 'package:sindbad/ui/pages/main/main.dart';
import 'package:sindbad/utils/color.dart';
import 'package:sindbad/utils/di.dart';
import 'package:sindbad/utils/shared_pref.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    setupDi();
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context) => HomeBloc()..add(HomeInitEvent())),
          BlocProvider(create: (BuildContext context) => CategoryBloc()..add(CategoryInitEvent())),
          BlocProvider(create: (BuildContext context) => CartBloc()..add(CartInitEvent())),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Sindbad',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: MColor.blue),
            useMaterial3: true,
          ),
          // home: SplashPage(),
          home: SplashPage(),
        ));
  }
}

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    directPage(context);
    return Scaffold();
  }
}

void directPage(context) async {
  await getIt<SharedPref>().init();
  if (getIt<SharedPref>().isAuth()) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MainPage()),
    );
  } else {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => AuthPage()),
    );
  }
}
