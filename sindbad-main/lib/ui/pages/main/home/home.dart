import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sindbad/bloc/home/bloc.dart';
import 'package:sindbad/bloc/home/event.dart';
import 'package:sindbad/bloc/home/state.dart';
import 'package:sindbad/ui/widget/product.dart';
import 'package:sindbad/utils/color.dart';
import 'package:sindbad/utils/string.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatelessWidget {
  final controller = PageController();
  final Function()? openProduct;
  ScrollController _scrollController = ScrollController();

  HomePage({super.key, this.openProduct});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (state is HomeLoadedState) {
        return Column(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
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
                      prefixIconConstraints: BoxConstraints())),
            ),
            Expanded(
                child: ListView(
              physics: const ClampingScrollPhysics(),
              controller: _scrollController,
              children: [
                Container(
                  height: 200,
                  margin: const EdgeInsets.only(bottom: 10),
                  child: PageView.builder(
                      padEnds: false,
                      controller: controller,
                      itemCount: 5,
                      itemBuilder: ((context, index) {
                        return Container(
                          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              MString.fakeImageLink,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      })),
                ),
                Center(
                  child: SmoothPageIndicator(
                    controller: controller,
                    count: 5,
                    effect: ExpandingDotsEffect(dotColor: MColor.main, activeDotColor: MColor.main, dotHeight: 10, dotWidth: 10),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GridView.builder(
                    padding: EdgeInsets.all(20),
                    controller: _scrollController,
                    shrinkWrap: true,
                    itemCount: state.productResponceModel.results?.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 0.58, mainAxisSpacing: 20, crossAxisSpacing: 15),
                    itemBuilder: (ctxt, index) {
                      return GestureDetector(
                          onTap: () {
                            context
                                .read<HomeBloc>()
                                .add(HomeOpenDetailEvent(id: state.productResponceModel.results![index].id ?? 1));
                            openProduct!();
                          },
                          child: ProductCard(
                            product: state.productResponceModel.results![index],
                          ));
                    })
              ],
            ))
          ],
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
