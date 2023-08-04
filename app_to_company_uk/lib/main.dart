import 'package:app_to_company_uk/generated/l10n.dart';
// import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'Screens/FirstScreenAnimatedLogo.dart';
import 'package:share_plus/share_plus.dart';
/*
Приложение для обработки заявок ТК
на 1 экране анимация лого
на 2 вводятся данные и загружаются фото
на 3 информация о компании


в папке l10n находятся все файлы инициализации помечанные как арб формат - формат фалов локализации
в формате ключ - значение будут описываться все строки локализации

в файле messages_ru будут все слова русские
мы будем обращаться не как к словарю ключу чтобы получить значение
а будем обращаться к конкретным полям объектам класса локализации
это + потому что никогда не сможем ошибиться в неймине


*/

Future<void> main() async {
  runApp(const FirstScreen());
  WidgetsFlutterBinding.ensureInitialized();
  // final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  // final firstCamera = cameras.first;
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate, // c - с это сгенерируемый класс локализации
        GlobalMaterialLocalizations
            .delegate, // делегат то что перекидывает локализаию - их пробрасываем в момент иницилизации прил
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate
          .supportedLocales, // список того какие языки доступны в приложении
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
