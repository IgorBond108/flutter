import 'package:flutter/material.dart';
import 'package:sindbad/utils/color.dart';

class CustomBottomNav extends StatelessWidget {
  final Function(int) onTap;
  int index;

  double? screenWidth;

  CustomBottomNav({super.key, required this.onTap, required this.index});

  @override
  Widget build(BuildContext context) {
    screenWidth ??= (MediaQuery.of(context).size.width / 5);
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: double.infinity,
          height: 76,
          decoration: BoxDecoration(
            color: MColor.main,
          ),
        ),
        AnimatedPositioned(
          width: screenWidth,
          duration: Duration(milliseconds: 300),
          curve: Curves.linear,
          left: index * screenWidth!,
          child: Container(
            height: 40,
            width: 80,
            margin: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(100)),
          ),
        ),
        Container(
          height: 76,
          padding: EdgeInsets.only(bottom: 30),
          child: Row(
            children: [
              Expanded(child: _createItem("Новости", "assets/ic_home.png", 0)),
              Expanded(child: _createItem("Акции", "assets/ic_search.png", 1)),
              Expanded(child: _createItem("Грузы", "assets/ic_cart.png", 2)),
              Expanded(
                  child: _createItem("Балас", "assets/ic_favorites.png", 3)),
              Expanded(
                  child: _createItem("Профиль", "assets/ic_profile.png", 4)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _createItem(title, imagePath, i) {
    return GestureDetector(
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              imagePath,
              width: 20,
              color: index == i ? MColor.main : Colors.white,
            ),
          ],
        ),
      ),
      onTap: () {
        onTap(i);
      },
    );
  }
}
