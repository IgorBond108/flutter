import 'package:flutter/material.dart';
import 'package:test_teleport/widgets/square.dart';

class ItemsFavorities extends StatelessWidget {
  final Items1 item;

  const ItemsFavorities({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: item.onTap,
      child: Container(
          padding: const EdgeInsets.all(8),
          width: 76,
          height: 84,
          decoration: BoxDecoration(boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2,
              offset: Offset(1, 1), // Shadow position
            ),
          ], color: Colors.white, borderRadius: BorderRadius.circular(6)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                item.item,
                width: 24,
                height: 24,
              ),
              Text(item.name, style: const TextStyle(fontSize: 10)),
            ],
          )),
    );
  }
}
