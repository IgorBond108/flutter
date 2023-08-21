import 'package:flutter/material.dart';

import 'news_picture.dart';

class ListNews extends StatelessWidget {
  const ListNews({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (context, index) => const SizedBox(
        width: 16,
      ),
      itemCount: 3,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        List<ItemsNews> list = [
          ItemsNews(
              '/Users/admin/Documents/GitHub/flutter-app/test_teleport/assets/icons_buttomNavigationBar/Rectangle8.png',
              'Суперакция от Веккер Закажи окно до конца сентября и получи мегаскидку плюсь бонусы на счёт'),
          ItemsNews(
              '/Users/admin/Documents/GitHub/flutter-app/test_teleport/assets/icons_buttomNavigationBar/Rectangle10.png',
              'При заказе одной кружки кофе Вы получите 20 бонусов на счет.'),
          ItemsNews(
              '/Users/admin/Documents/GitHub/flutter-app/test_teleport/assets/icons_buttomNavigationBar/Rectangle8.png',
              'Суперакция от Веккер Закажи окно до конца сентября и получи мегаскидку плюсь бонусы на счёт'),
        ];

        // if (index == 0) {
        //   return const SizedBox(width: 10);
        // } else {
        return NewsPicture(item: list[index]);
        // }
      },
    );
  }
}

class ItemsNews {
  final String item;
  final String name;

  ItemsNews(this.item, this.name);
}
