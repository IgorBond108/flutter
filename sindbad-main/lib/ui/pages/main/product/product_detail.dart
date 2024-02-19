import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sindbad/bloc/cart/bloc.dart';
import 'package:sindbad/bloc/cart/event.dart';
import 'package:sindbad/bloc/home/bloc.dart';
import 'package:sindbad/bloc/home/state.dart';
import 'package:sindbad/ui/widget/btn.dart';
import 'package:sindbad/utils/color.dart';
import 'package:sindbad/utils/string.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailPage extends StatelessWidget {
  final Function()? onBackClicked;
  final controller = PageController();

  ProductDetailPage({super.key, this.onBackClicked});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (state is HomeDetailLoadedState) {
        return Column(
          children: [
            Row(
              children: [
                GestureDetector(
                    onTap: onBackClicked,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Icon(Icons.arrow_back),
                    )),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(10, 20, 8, 20),
                    padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                    decoration: BoxDecoration(
                        border: Border.all(color: MColor.grey),
                        borderRadius: BorderRadius.circular(8)),
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
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Image.asset(
                    'assets/ic_heart.png',
                    width: 26,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 15, 8),
                  child: Image.asset(
                    'assets/ic_share.png',
                    width: 26,
                  ),
                ),
              ],
            ),
            Expanded(
                child: ListView(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 450,
                      margin: EdgeInsets.only(bottom: 10),
                      // width: double.infinity,
                      child: PageView.builder(
                          padEnds: false,
                          controller: controller,
                          itemCount:
                              state.productDetailModel.productImages?.length,
                          itemBuilder: ((context, indx) {
                            return Image.network(
                              state.productDetailModel.productImages?[indx]
                                      .image ??
                                  MString.fakeImageLink,
                              fit: BoxFit.cover,
                            );
                          })),
                    ),
                    Positioned(
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8)),
                              color: Colors.red),
                          child: Text(
                            '-60%',
                            style: TextStyle(color: Colors.white),
                          ),
                        ))
                  ],
                ),
                Center(
                  child: SmoothPageIndicator(
                    controller: controller,
                    count: state.productDetailModel.productImages?.length??0,
                    effect: ExpandingDotsEffect(
                        dotColor: MColor.main,
                        activeDotColor: MColor.main,
                        dotHeight: 10,
                        dotWidth: 10),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Text(
                    '${state.productDetailModel.title}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
                  child: Row(
                    children: [
                      Text(
                        '${state.productDetailModel.salePrice} ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${state.productDetailModel.discountPrice}',
                        style: TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Text('${state.productDetailModel.description}'),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 20, 20, 5),
                  padding: EdgeInsets.all(14),
                  decoration: BoxDecoration(color: MColor.lightBlue),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/ic_star.png',
                        height: 14,
                      ),
                      Text(' ${state.productDetailModel.rate}'),
                      Center(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(4, 0, 4, 0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.grey),
                          width: 5,
                          height: 5,
                        ),
                      ),
                      Text('${state.productDetailModel.reviewsCount} оценок'),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 5, 20, 10),
                  padding: EdgeInsets.all(14),
                  decoration: BoxDecoration(color: MColor.lightBlue),
                  child: Row(
                    children: [
                      Text('Характеристики'),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 5, 20, 0),
                  padding: EdgeInsets.all(14),
                  decoration: BoxDecoration(color: MColor.lightBlue),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/ic_shop.png',
                        height: 14,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Характеристики'),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                        child: MButton(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Добавлен'),
                        ));
                        context.read<CartBloc>().add(
                            CartAddEvent(productId: state.id, quantity: 1));
                      },
                      text: 'В корзину',
                      bgColor: MColor.main,
                      margin: EdgeInsets.fromLTRB(20, 20, 10, 20),
                    )),
                    Expanded(
                        child: MButton(
                            onTap: () {},
                            text: 'Купить сейчас',
                            bgColor: MColor.blue,
                            margin: EdgeInsets.fromLTRB(10, 20, 20, 20))),
                  ],
                )
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
