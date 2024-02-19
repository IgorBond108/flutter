import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sindbad/bloc/home/bloc.dart';
import 'package:sindbad/bloc/home/event.dart';
import 'package:sindbad/bloc/home/state.dart';
import 'package:sindbad/ui/widget/product.dart';
import 'package:sindbad/utils/color.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (state is HomeLoadedState) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(children: [
                    const UpRow(),
                    const TextFieldSearch(),
                    GridView.builder(
                        padding: const EdgeInsets.all(20),
                        // controller: _scrollController,
                        shrinkWrap: true,
                        itemCount: state.productResponceModel.results?.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.58, mainAxisSpacing: 20, crossAxisSpacing: 15),
                        itemBuilder: (ctxt, index) {
                          return ProductCard(
                            product: state.productResponceModel.results![index],
                          );
                        }),
                  ]),
                ),
              ),
            ),
          ),
        );
      } else {
        return Center(
          child: SizedBox(
            width: 40,
            height: 40,
            child: CircularProgressIndicator(),
          ),
        );
      }
    });
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
          'Избранное',
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
    return Container(
      margin: const EdgeInsets.all(20),
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
    );
  }
}
