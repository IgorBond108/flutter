import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sindbad/bloc/home/bloc.dart';
import 'package:sindbad/bloc/home/event.dart';
import 'package:sindbad/bloc/home/state.dart';
import 'package:sindbad/ui/widget/product.dart';
import 'package:sindbad/utils/color.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MyCartsPage extends StatefulWidget {
  const MyCartsPage({super.key});

  @override
  State<MyCartsPage> createState() => _MyCartsPageState();
}

class _MyCartsPageState extends State<MyCartsPage> {
  List<bool> isSelected = [false, false, false];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(16),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    children: [
                      const UpRow(),
                      Container(
                          width: 380,
                          height: 308,
                          margin: const EdgeInsets.only(top: 20),
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 20)]),
                          child: Row(
                            children: [
                              Icon(Icons.circle_outlined),
                              Stack(
                                children: [
                                  Image.asset(
                                    '/Users/admin/Downloads/sindbad-main/assets/photo_items/Combined-Shape.png',
                                    width: 37,
                                    height: 9,
                                  ),
                                ],
                              ),
                              Text('Mir '),
                              Text(' ***441'),
                              // ToggleButtons(
                              //   children: [Icon(Icons.circle), Icon(Icons.settings), Icon(Icons.person)],
                              //   onPressed: (int index) {
                              //     setState(() {
                              //       isSelected[index] = !isSelected[index];
                              //     });
                              //   },
                              //   isSelected: isSelected,
                              // ),
                            ],
                          )),
                    ],
                  ),
                )),
          ),
        ),
      );
    }
        // } else {
        //   return Center(
        //     child: SizedBox(
        //       width: 40,
        //       height: 40,
        //       child: CircularProgressIndicator(),
        //     ),
        //   )}
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
          'Мои карты',
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
