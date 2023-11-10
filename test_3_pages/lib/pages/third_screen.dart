import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/weather_bloc.dart';
import '../models/weather_forecast.dart';
import '../widgets/city_view.dart';
import '../widgets/data_weather.dart';

class ThirdScreen extends StatefulWidget {
  ThirdScreen({super.key, required cityName});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
  String cityName = 'Саратов';
}

class _ThirdScreenState extends State<ThirdScreen> {
/*

Отображение актуальной погоды в Саратове с автоматическим обновлением каждые 2-3 секунды.
Поле для ввода названия другого города и отображение погоды для этого города.

*/

  late Future<WeatherForecast> forecastObject;

  // get cityName => null;

  void initState() {
    super.initState();
    // const oneSecond = Duration(seconds: 25);
    // Timer.periodic(oneSecond, (Timer t) => setState(() {}));
    context.read<WeatherBloc>().add(SearchCity(cityQuery: widget.cityName));
    // print(oneSecond);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Погода в городе'),
        centerTitle: true,
        actions: <Widget>[
          // слушаем состояние WeatherBloc и реагируем на ошибку
          BlocConsumer<WeatherBloc, WeatherState>(listener: (context, state) {
            if (state is WeatherStateError) {
              var snackBar = SnackBar(
                //  создаем переменную в случае отсутствия интернета или города в списке
                content: Text(state //
                    .message), // будет выведено сообщение в снекбаре об ошибке
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          }, builder: (context, state) {
            if (state is WeatherStateLoaded) {
              // final forecastObject = state.forecastObject;
              return IconButton(
                  color: Colors.green,
                  icon: const Icon(
                    Icons.looks_3,
                    size: 30,
                  ),
                  onPressed: () {});
            } else {
              return const SizedBox.shrink();
            }
          }),
        ],
      ), // в BlocBuilder отрисовываем данные о погоде если данные получены
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(10),
              labelText: ('Введите название города'),
              hintText: "Москва,Санкт-Петербург,Краснодар,Казань....",
              filled: true,
            ),
            onChanged: (value) {
              // var cityName = value;
            },
          ),
          ElevatedButton(
            child: Text(
              'Подтвердить',
              style: TextStyle(fontSize: 20.0),
            ),
            onPressed: () {
              // context.read<WeatherBloc>().add(SearchCity(cityQuery: widget.cityName));
            },
          ),
          BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              if (state is WeatherStateLoaded) {
                final forecastObject = state.forecastObject;
                return Center(
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 50.0),
                      CityView(snapshot: forecastObject),
                      const SizedBox(height: 50.0),
                      DataWeather(weatherForeCast: forecastObject),
                    ],
                  ),
                );
              } else {
                return const Center(
                  child: Text(
                    'Ошибка получения данных',
                    style: TextStyle(fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
