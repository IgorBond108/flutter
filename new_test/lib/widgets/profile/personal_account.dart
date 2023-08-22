import 'package:flutter/material.dart';

import '../bottom_navigation_bar.dart';

class PersonalAccount extends StatefulWidget {
  const PersonalAccount({super.key});

  @override
  State<PersonalAccount> createState() => _PersonalAccountState();
}

class _PersonalAccountState extends State<PersonalAccount> {
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
      bottomNavigationBar:
          bottomNavigationBar(_selectedTab, onSelectTab(_selectedTab)),
      appBar: AppBar(
        centerTitle: false,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: <Widget>[
          IconButton(
              iconSize: 20,
              onPressed: () {},
              icon: Image.asset('assets/icons_buttomNavigationBar/exit.png'))
        ],
        backgroundColor: const Color(0xff00a3ff),
        title: const Row(
          children: [
            Text(
              'Профиль',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xff00a3ff),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: 690,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 33,
                    ),
                    Image.asset(
                        // width: 20,
                        // height: 20,
                        'assets/icons_buttomNavigationBar/button.png'),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text('Васильков Кирилл Александрович '),
                    const SizedBox(
                      height: 3,
                    ),
                    const Text(
                      '+7 922 123 45 67 ',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF8A898E)),
                    ),
                    const SizedBox(
                      height: 39.5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const SizedBox(
                          height: 49,
                        ),
                        const Column(
                          children: [
                            Text(
                              '1 485,67 ₽',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.blue,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              'Кошелек ImPay',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF8A898E)),
                            ),
                          ],
                        ),
                        Container(
                          height: 39,
                          width: 1,
                          color: Colors.blue,
                        ),
                        const Column(
                          children: [
                            Text(
                              '5 485,67 ₽',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.blue,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              'Накопленно бонусов',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF8A898E)),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 37,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 12,
                        ),
                        Stack(children: [
                          Container(
                            width: 38,
                            height: 38,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 2,
                                    offset: Offset(1, 1), // Shadow position
                                  ),
                                ]),
                            child: const Padding(
                                padding: EdgeInsets.all(0.0),
                                child: Center(
                                  child: Icon(
                                    Icons.person,
                                    color: Color.fromARGB(255, 31, 151, 255),
                                  ),
                                )),
                          ),
                        ]),
                        const SizedBox(
                          width: 23,
                        ),
                        const Text(
                          'Мои данные',
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(
                          width: 160,
                        ),
                        const Icon(Icons.arrow_forward_ios_sharp,
                            color: Colors.grey),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 12,
                        ),
                        Stack(
                          children: [
                            Container(
                              width: 38,
                              height: 38,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 2,
                                      offset: Offset(1, 1), // Shadow position
                                    ),
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: Center(
                                    child: Image.asset(
                                        'assets/icons_buttomNavigationBar/Title.png')),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 23,
                        ),
                        const Text(
                          'Помощь',
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    )
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
