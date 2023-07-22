import 'package:flutter/material.dart';

import '../locale/app_localization.dart';
import 'package:app_to_company_uk/locale/app_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl_translation/extract_messages.dart';
import 'package:intl_translation/generate_localized.dart';
import 'package:intl_translation/visitors/interpolation_visitor.dart';
import 'package:intl_translation/visitors/message_finding_visitor.dart';
import 'package:intl_translation/visitors/plural_gender_visitor.dart';

import 'ThirdScreenInfoCompany.dart';

class InfoAboutZakaz extends StatefulWidget {
  const InfoAboutZakaz({super.key, required this.title});
  final String title;

  @override
  State<InfoAboutZakaz> createState() => _InfoAboutZakazState();
}

class _InfoAboutZakazState extends State<InfoAboutZakaz> {
  final AppLocalizationDelegate _localeOverrideDelegate =
      const AppLocalizationDelegate(Locale('ru', 'RU'));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        _localeOverrideDelegate
      ],
      supportedLocales: const [Locale('ru', 'RU'), Locale('uk', 'UK')],
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(AppLocalization.of(context)!.heyWorld
              // 'CUSTOMS LOGISTICS '
              ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //     ElevatedButton(
                  //       child: const Text(
                  //         'RU',
                  //         style: TextStyle(fontSize: 20.0),
                  //       ),
                  //       onPressed: () {
                  //         setState(() {
                  //           AppLocalization.load(const Locale('ru', 'RU'));
                  //         });
                  //       },
                  //     ),
                  //     ElevatedButton(
                  //       child: const Text(
                  //         'О компании',
                  //         style: TextStyle(fontSize: 20.0),
                  //       ),
                  //       onPressed: () {
                  //         Navigator.pushReplacement(
                  //             context,
                  //             MaterialPageRoute(
                  //                 builder: (context) => const ThirdScreen()));
                  //       },
                  //     ),
                  //     ElevatedButton(
                  //       child: const Text(
                  //         'UK',
                  //         style: TextStyle(fontSize: 20.0),
                  //       ),
                  //       onPressed: () {
                  //         setState(() {
                  //           AppLocalization.load(const Locale('uk', 'UK'));
                  //         });
                  //       },
                  //     ),
                  //   ],
                  // ),
                  Expanded(
                    flex: 1,
                    child: ListTile(
                      leading: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            AppLocalization.load(const Locale('ru', 'RU'));
                          });
                        },
                        child: const Text('Russian'),
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            AppLocalization.load(const Locale('uk', 'UK'));
                          });
                        },
                        child: const Text('Urkain'),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      AppLocalization.of(context)!.heyWorld,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(child: Text('Введите свои данные ниже')),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      labelText: ('Митниця Розмитнення/Таможня Растаможка'),
                      hintText: "",
                      filled: true,
                    ),
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      labelText: ('Маршрут (трасса) по країнам / по странам'),
                      hintText: "",
                      filled: true,
                    ),
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      labelText: ('Телефон i ФІО водія/Телефон и ФИО водителя'),
                      hintText: "Іван Іванович Іванов/Иван Иванович Иванов",
                      filled: true,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Експортна декларація',
                    style: TextStyle(fontSize: 13),
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      labelText: ('фото/або внести дані вручну '),
                      hintText: "номер i дата",
                      filled: true,
                    ),
                  ),
                  // const Text('(фото/або внести дані вручну номер і дата)'),
                  ElevatedButton(
                    child: const Text(
                      'Загрузить ',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Автодорожная накладная CMR'),
                  ElevatedButton(
                    child: const Text(
                      'Загрузить',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Інвойс/Инвойс'),
                  ElevatedButton(
                    child: const Text(
                      'Загрузить',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Паспорт водія/ Паспорт водителя'),
                  ElevatedButton(
                    child: const Text(
                      'Загрузить',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Технічний паспорт Тягача'),
                  ElevatedButton(
                    child: const Text(
                      'Загрузить',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Технічний паспорт Причепа'),
                  ElevatedButton(
                    child: const Text(
                      'Загрузить',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Додаткові документи/Дополнительные документы',
                    style: TextStyle(fontSize: 13),
                  ),
                  ElevatedButton(
                    child: const Text(
                      'Загрузить',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
