// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `CUSTOMS LOGISTICS`
  String get customsLogistics {
    return Intl.message(
      'CUSTOMS LOGISTICS',
      name: 'customsLogistics',
      desc: '',
      args: [],
    );
  }

  /// `Технічний паспорт Тягача`
  String get tehpasport {
    return Intl.message(
      'Технічний паспорт Тягача',
      name: 'tehpasport',
      desc: '',
      args: [],
    );
  }

  /// `Привет`
  String get hello {
    return Intl.message(
      'Привет',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `Введите свои данные ниже`
  String get indata {
    return Intl.message(
      'Введите свои данные ниже',
      name: 'indata',
      desc: '',
      args: [],
    );
  }

  /// `Митниця Розмитнення/Таможня Растаможка`
  String get tamozhnya {
    return Intl.message(
      'Митниця Розмитнення/Таможня Растаможка',
      name: 'tamozhnya',
      desc: '',
      args: [],
    );
  }

  /// `Маршрут (трасса) по країнам / по странам`
  String get marshrut {
    return Intl.message(
      'Маршрут (трасса) по країнам / по странам',
      name: 'marshrut',
      desc: '',
      args: [],
    );
  }

  /// `Телефон i ФІО водія/Телефон и ФИО водителя`
  String get tel_fio {
    return Intl.message(
      'Телефон i ФІО водія/Телефон и ФИО водителя',
      name: 'tel_fio',
      desc: '',
      args: [],
    );
  }

  /// `Іван Іванович Іванов/Иван Иванович Иванов`
  String get ivan_primer {
    return Intl.message(
      'Іван Іванович Іванов/Иван Иванович Иванов',
      name: 'ivan_primer',
      desc: '',
      args: [],
    );
  }

  /// `Експортна декларація`
  String get declaration {
    return Intl.message(
      'Експортна декларація',
      name: 'declaration',
      desc: '',
      args: [],
    );
  }

  /// `фото/або внести дані вручну `
  String get photo_text {
    return Intl.message(
      'фото/або внести дані вручну ',
      name: 'photo_text',
      desc: '',
      args: [],
    );
  }

  /// `номер i дата`
  String get no_data {
    return Intl.message(
      'номер i дата',
      name: 'no_data',
      desc: '',
      args: [],
    );
  }

  /// `Загрузить `
  String get load {
    return Intl.message(
      'Загрузить ',
      name: 'load',
      desc: '',
      args: [],
    );
  }

  /// `Автодорожная накладная CMR`
  String get cmr {
    return Intl.message(
      'Автодорожная накладная CMR',
      name: 'cmr',
      desc: '',
      args: [],
    );
  }

  /// `Інвойс/Инвойс`
  String get invois {
    return Intl.message(
      'Інвойс/Инвойс',
      name: 'invois',
      desc: '',
      args: [],
    );
  }

  /// `Паспорт водія/ Паспорт водителя`
  String get pas_vod {
    return Intl.message(
      'Паспорт водія/ Паспорт водителя',
      name: 'pas_vod',
      desc: '',
      args: [],
    );
  }

  /// `Технічний паспорт Причепа`
  String get pas_pric {
    return Intl.message(
      'Технічний паспорт Причепа',
      name: 'pas_pric',
      desc: '',
      args: [],
    );
  }

  /// `Додаткові документи/Дополнительные документы`
  String get dopolnitelno {
    return Intl.message(
      'Додаткові документи/Дополнительные документы',
      name: 'dopolnitelno',
      desc: '',
      args: [],
    );
  }

  /// `Отправить`
  String get otpravitButton {
    return Intl.message(
      'Отправить',
      name: 'otpravitButton',
      desc: '',
      args: [],
    );
  }

  /// `Комментарий`
  String get kommentariy {
    return Intl.message(
      'Комментарий',
      name: 'kommentariy',
      desc: '',
      args: [],
    );
  }

  /// `Пожалуйста выберие изображение`
  String get please_vibery_image {
    return Intl.message(
      'Пожалуйста выберие изображение',
      name: 'please_vibery_image',
      desc: '',
      args: [],
    );
  }

  /// `Пожалуйста выберие изображение`
  String get pleaseviberyizobrazhenie {
    return Intl.message(
      'Пожалуйста выберие изображение',
      name: 'pleaseviberyizobrazhenie',
      desc: '',
      args: [],
    );
  }

  /// `Пожалуйста выберие изображение`
  String get pvi {
    return Intl.message(
      'Пожалуйста выберие изображение',
      name: 'pvi',
      desc: '',
      args: [],
    );
  }

  /// `Загрузить с галереи`
  String get zagsgal {
    return Intl.message(
      'Загрузить с галереи',
      name: 'zagsgal',
      desc: '',
      args: [],
    );
  }

  /// `Загрузить с камеры`
  String get zagscam {
    return Intl.message(
      'Загрузить с камеры',
      name: 'zagscam',
      desc: '',
      args: [],
    );
  }

  /// `Загрузить`
  String get zagruzit {
    return Intl.message(
      'Загрузить',
      name: 'zagruzit',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'uk'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
