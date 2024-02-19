import 'package:flutter/material.dart';
import 'package:sindbad/ui/pages/main/profile/favourites.dart';
import 'package:sindbad/ui/pages/main/profile/feedback_questions.dart';
import 'package:sindbad/ui/pages/main/profile/my_carts.dart';
import 'package:sindbad/ui/pages/main/profile/orders.dart';

class ProfilePage extends StatelessWidget {
  final Function(int) setIndexPage;

  const ProfilePage({super.key, required this.setIndexPage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setIndexPage(0);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    weight: 30,
                  ),
                ),
                const Spacer(),
                const Text(
                  'Профиль',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Image.asset(
                    'assets/ic_bell.png',
                    width: 22,
                    height: 22,
                  ),
                ),
              ],
            ),
            //-----take this all to widget
            GestureDetector(
              onTap: () {
                setIndexPage(6);
              },
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 20)]),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/ic_face.png',
                      width: 50,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text('Павел Космодевьянцев'),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OrdersPage(),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 20)]),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/ic_box.png',
                      width: 30,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text('Заказы'),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FavouritesPage(),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 20)]),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/ic_favorites.png',
                      color: Colors.black,
                      width: 30,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text('Избранное'),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyCartsPage(),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 20)]),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/ic_cards.png',
                      color: Colors.black,
                      width: 30,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text('Мои карты'),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FeedbackQuestions(),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 20)]),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/ic_messages.png',
                      width: 30,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text('Отзывы и вопросы'),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 20)]),
              child: Row(
                children: [
                  Image.asset(
                    'assets/ic_help.png',
                    width: 30,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text('Поддержка'),
                  const Spacer(),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 20)]),
              child: Row(
                children: [
                  Image.asset(
                    'assets/ic_settings.png',
                    width: 30,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text('Настройки'),
                  const Spacer(),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
