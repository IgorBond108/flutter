import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sindbad/bloc/cart/bloc.dart';
import 'package:sindbad/ui/widget/cart.dart';
import 'package:sindbad/utils/color.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../bloc/cart/state.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Column(children: [
                UpRow(),
                TextFieldSearch(),
                CardOrder(),
                CardOrder(),
                CardOrder(),
                CardOrder(),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

class CardOrder extends StatefulWidget {
  const CardOrder({
    super.key,
  });

  @override
  State<CardOrder> createState() => _CardOrderState();
}

class _CardOrderState extends State<CardOrder> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: ((context) {}),
            backgroundColor: Colors.grey,
            icon: Icons.remove_red_eye_sharp,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Container(
          height: 110,
          // margin: const EdgeInsets.only(top: 16),
          // padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 20)]),
          child: Padding(
            padding: const EdgeInsets.only(top: 16, left: 12, bottom: 16),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Container(
                    width: 60,
                    height: 78,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      image: DecorationImage(
                        image: AssetImage("/Users/admin/Downloads/sindbad-main/assets/photo_items/photo.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    // width: 300,
                    // height: 300,
                  ),
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 12),
                      child: Text(
                        'Беспроводные наушники Air Pro 2.0',
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 4),
                          child: Text(
                            '8 749 ₽',
                            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
                          ),
                        ),
                        Text(
                          '9 643 ₽',
                          style: TextStyle(
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UpRow extends StatelessWidget {
  const UpRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(
            Icons.arrow_back,
            weight: 30,
            size: 24,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        const Spacer(),
        const Text(
          'Мои заказы',
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
    );
  }
}

class TextFieldSearch extends StatelessWidget {
  const TextFieldSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Container(
        // margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
        decoration: BoxDecoration(border: Border.all(color: MColor.grey), borderRadius: BorderRadius.circular(8)),
        child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Найти на Sindbad',
                hintStyle: TextStyle(color: MColor.grey),
                contentPadding: EdgeInsets.zero,
                isDense: true,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: Image.asset(
                    'assets/ic_search2.png',
                    height: 20,
                    width: 20,
                  ),
                ),
                prefixIconConstraints: const BoxConstraints())),
      ),
    );
  }
}
