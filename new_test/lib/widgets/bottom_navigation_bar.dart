import 'package:flutter/material.dart';

BottomNavigationBar bottomNavigationBar(int selectedTab, void onSelectTab) {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    currentIndex: selectedTab,
    items: [
      BottomNavigationBarItem(
          icon: Image.asset('assets/icons_buttomNavigationBar/Union.png'),
          label: 'Главная'),
      BottomNavigationBarItem(
        icon: Image.asset(
            'assets/icons_buttomNavigationBar/003-shopping-bag-1.png'),
        label: 'Покупки',
      ),
      BottomNavigationBarItem(
          icon: Image.asset('assets/icons_buttomNavigationBar/005-wallet.png'),
          label: 'Платежи'),
      BottomNavigationBarItem(
          icon: Image.asset('assets/icons_buttomNavigationBar/003-chat.png'),
          label: 'Чат'),
      BottomNavigationBarItem(
          icon: Image.asset('assets/icons_buttomNavigationBar/002-gift.png'),
          label: 'Бонусы'),
    ],
  );
}
