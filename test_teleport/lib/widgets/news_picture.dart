import 'package:flutter/material.dart';
import 'package:test_teleport/widgets/list_news.dart';

class NewsPicture extends StatelessWidget {
  final ItemsNews item;

  const NewsPicture({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 180,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10), // Image border
            child: SizedBox.fromSize(
              size: const Size.fromRadius(180), // Image radius
              child: Image.asset(
                item.item,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            // top: 90,
            bottom: 10,
            right: 10,
            left: 10,
            child: Text(
              item.name,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                height: 1.2857142857,
                letterSpacing: -0.1539999992,
                color: Color(0xffffffff),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
