import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'Screens/FirstScreenAnimatedLogo.dart';
// import 'package:intl/intl.dart';
// import 'package:intl_translation/extract_messages.dart';
// import 'package:intl_translation/generate_localized.dart';
// import 'package:intl_translation/visitors/interpolation_visitor.dart';
// import 'package:intl_translation/visitors/message_finding_visitor.dart';
// import 'package:intl_translation/visitors/plural_gender_visitor.dart';

import 'locale/app_localization.dart';

/*
Приложение для обработки заявок ТК
на 1 экране анимация лого
на 2 вводятся данные и загружаются фото
на 3 информация о компании

*/

void main() {
  runApp(const FirstScreen());
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  final AppLocalizationDelegate _localeOverrideDelegate =
      const AppLocalizationDelegate(Locale('en', 'US'));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        _localeOverrideDelegate
      ],
      supportedLocales: const [Locale('en', 'US'), Locale('de', 'DE')],
      // supportedLocales: const [Locale('ru', 'RU'), Locale('uk', 'UK')],
      title: '',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 33, 126, 225)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'CUSTOMS LOGISTICS'),
    );
  }
}
