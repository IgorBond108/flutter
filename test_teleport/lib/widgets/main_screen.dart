import 'package:flutter/material.dart';
import 'package:test_teleport/widgets/notification_widget.dart';
import 'package:test_teleport/widgets/profile/personal_account.dart';
import 'package:test_teleport/widgets/square.dart';

import 'bottom_navigation_bar.dart';
import 'favourites.dart';
import 'list_news.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedTab = 1;

  void onSelectTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff00a3ff),
      bottomNavigationBar:
          bottomNavigationBar(_selectedTab, onSelectTab(_selectedTab)),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Row(
                // первая строка это картинка с именем переводящая на экран пользователя
                children: [
                  IconButton(
                    icon: Image.asset(
                        '/Users/admin/Documents/GitHub/flutter-app/test_teleport/assets/icons_up_row/button.png',
                        width: 40,
                        height: 40),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const PersonalAccount()));
                    },
                  ),
                  const Text(
                    'Кирилл',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 190),
                  const NotificationWidget(),
                ],
              ),
              Row(
                children: [
                  Text(
                    '   Баланс кошелька ImPay',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 2,
                      letterSpacing: -1,
                      color: Color(0xffffffff),
                    ),
                  ),
                  SizedBox(width: 100),
                  Text(
                    '5 485,67 ₽',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      height: 1.25,
                      letterSpacing: -1,
                      color: Color(0xffffffff),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: const TextField(
                          decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                              border: InputBorder.none,
                              hintText: 'Поиск',
                              fillColor: Color(0x26ffffff),
                              filled: true,
                              hintStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                height: 1.30,
                                letterSpacing: -0.5,
                                color: Colors.white,
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.textScaleFactorOf(context),
                height: 600,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: 27, left: 12, right: 250, bottom: 10),
                          child: Text(
                            'ИЗБРАННОЕ',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 1.2857142857,
                              letterSpacing: 1,
                              color: Color(0xff8a898e),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    const SizedBox(height: 86, child: MySquare()),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 14,
                        left: 12,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'НОВОСТИ',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 1.2857142857,
                              letterSpacing: 1,
                              color: Color(0xff8a898e),
                            ),
                          ),
                          IconButton(
                              iconSize: 20,
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_forward_ios_sharp,
                                  color: Colors.grey)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 180, child: ListNews()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
