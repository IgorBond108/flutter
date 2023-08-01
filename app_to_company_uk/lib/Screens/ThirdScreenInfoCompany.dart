import 'package:flutter/material.dart';

import 'SecondScreenInputtDataAndPhoto.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('О компании'),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const InfoAboutZakaz(
                                title: '',
                              )));
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
        ),
        body: ListView(
          children: [
            Column(
              children: [
                Image.asset('assets/images/withMe.png'),
                const SizedBox(
                  height: 20,
                ),
                const Text('Таможенная логистика'),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                      'На рынке международных грузоперевозок наша компания Custom Logistics уже более 20 лет. Компания, в первую очередь, предлагает комплексные услуги по таможенному оформлению, складского хранения, консалтинговые и услуги по логистике.'),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                      'За это время мы разработали и внедрили несколько кейсов из основных услуг – а именно:'),
                ),
                // Icon(Icons.search),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                      'Таможенное оформление “под ключ”                        ',
                      style: TextStyle(decoration: TextDecoration.underline)),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                      'Услуги по хранению груза на собственном складе площадью 2500м2',
                      style: TextStyle(decoration: TextDecoration.underline)),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                      'Логистические услуги (доставка товара от склада до склада)',
                      style: TextStyle(decoration: TextDecoration.underline)),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                      'Консалтинговые услуги (сопровождение и оформление всех документов)',
                      style: TextStyle(decoration: TextDecoration.underline)),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                      'Если Вы планируете построить качественный бизнес на территории Украины и Европы, тогда мы именно те, кто вам нужен.' +
                          "\n" +
                          'Преимуществом нашего сотрудничества главным образом будет надежное и быстрое оформление всех необходимых таможенных документов для дальнейшего их использования в нужном кейсе. ' +
                          "\n" +
                          'Подробнее обо всех услугах можно узнать по телефону:'),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('+38 050 538 60 40' +
                      "\n" +
                      '+38 066 117 86 69' +
                      "\n" +
                      'График работы' +
                      "\n" +
                      'Пн-Сб: 9:00 - 18:00'),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('ООО «КАСТОМЗ ЛОДЖИСТИКС»' +
                      "\n" +
                      '89636, Закарпатская обл.' +
                      "\n" +
                      'Мукачевский район' +
                      "\n" +
                      'Пгт. Кольчино' +
                      "\n" +
                      'Ул. Локоты 12 / 16В'),
                ),
              ],
            ),
          ],
        ));
  }
}
