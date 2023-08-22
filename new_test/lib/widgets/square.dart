import 'package:flutter/material.dart';
import 'package:new_test/widgets/qr_code/screen_qr_pay.dart';

import 'items_favorites.dart';

class MySquare extends StatelessWidget {
  const MySquare({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      // physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (context, index) => const SizedBox(
        width: 16,
      ),
      itemCount: 4,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        List<Items1> list = [
          Items1('assets/icons_buttomNavigationBar/frame-242-8ud.png',
              'Мои платежи', () {}),
          Items1('assets/icons_buttomNavigationBar/003-park-tickets-couple.png',
              'Билеты', () {}),
          Items1('assets/icons_buttomNavigationBar/002-coupon.png',
              'Карты лояльности', () {}),
          Items1(
              'assets/icons_buttomNavigationBar/001-qr-menu.png', 'QR - оплата',
              () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ScanQR()));
          }),
        ];
        return ItemsFavorities(item: list[index]);
      },
    );
  }
}

class Items1 {
  final String item;
  final String name;
  final Function()? onTap;

  Items1(this.item, this.name, this.onTap);
}
