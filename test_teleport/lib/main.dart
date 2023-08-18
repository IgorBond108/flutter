import 'package:flutter/material.dart';
// import 'package:test_teleport/widgets/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

int _counter = 3;

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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedTab,
        items: [
          // навигацию делал сначала со встроенными в материал иконками - но позже подумал что вам нужно все как в фигме поэтому от туда вытянул их
          BottomNavigationBarItem(
              icon: Image.asset(
                  '/Users/admin/Documents/GitHub/flutter-app/test_teleport/assets/icons_buttomNavigationBar/Union.png'),
              label: 'Главная'),
          BottomNavigationBarItem(
            icon: Image.asset(
                '/Users/admin/Documents/GitHub/flutter-app/test_teleport/assets/icons_buttomNavigationBar/003-shopping-bag-1.png'),
            label: 'Покупки',
          ),
          BottomNavigationBarItem(
              icon: Image.asset(
                  '/Users/admin/Documents/GitHub/flutter-app/test_teleport/assets/icons_buttomNavigationBar/005-wallet.png'),
              label: 'Платежи'),
          BottomNavigationBarItem(
              icon: Image.asset(
                  '/Users/admin/Documents/GitHub/flutter-app/test_teleport/assets/icons_buttomNavigationBar/003-chat.png'),
              label: 'Чат'),
          BottomNavigationBarItem(
              icon: Image.asset(
                  '/Users/admin/Documents/GitHub/flutter-app/test_teleport/assets/icons_buttomNavigationBar/002-gift.png'),
              label: 'Бонусы'),
        ],
        onTap: onSelectTab,
      ),
      body: SafeArea(
        child: Column(
          // все виджеты будем отрисовывать в колонку
          textDirection: TextDirection.ltr,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              // первая строка это картинка с именем переводящая на экран пользователя
              children: [
                IconButton(
                  icon: Image.asset(
                      '/Users/admin/Documents/GitHub/flutter-app/test_teleport/assets/icons_up_row/button.png',
                      width: 40,
                      height: 40),
                  onPressed: () {},
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
                Stack(
                  children: [
                    const Icon(
                      Icons.notifications,
                      color: Colors.white,
                      size: 30,
                    ),
                    Container(
                      width: 30,
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 15,
                        height: 15,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Center(
                            child: Text(
                              _counter.toString(),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 10),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            const Row(
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
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(4.0),
                    child: TextField(
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
                            color: Color(0xffffffff),
                          )),
                    ),
                  ),
                ],
              ),
            ),
            // const HomePage(),
            Container(
              width: MediaQuery.sizeOf(context).width,
              // height: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              // padding: EdgeInsets.symmetric(horizontal: 100),
              child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Text(
                    //   'ИЗБРАННОЕ',
                    //   style: TextStyle(color: Colors.black),
                    // )
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
