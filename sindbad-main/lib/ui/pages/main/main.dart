import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sindbad/bloc/cart/bloc.dart';
import 'package:sindbad/bloc/cart/event.dart';
import 'package:sindbad/bloc/category/bloc.dart';
import 'package:sindbad/bloc/category/event.dart';
import 'package:sindbad/bloc/home/bloc.dart';
import 'package:sindbad/bloc/home/event.dart';
import 'package:sindbad/ui/pages/main/cart/cart.dart';
import 'package:sindbad/ui/pages/main/home/home.dart';
import 'package:sindbad/ui/pages/main/product/product_detail.dart';
import 'package:sindbad/ui/pages/main/profile/me.dart';
import 'package:sindbad/ui/pages/main/profile/profile.dart';
import 'package:sindbad/ui/pages/main/search/category.dart';
import 'package:sindbad/ui/widget/custom_bottom_nav.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: SafeArea(
              child: IndexedStack(index: index, children: [
            HomePage(
              openProduct: () {
                setState(() {
                  index = 5;
                });
              },
            ),
            CategoryPage(),
            CartPage(),
            HomePage(),
            ProfilePage(
              setIndexPage: (i) {
                setState(() {
                  index = i;
                });
              },
            ),
            ProductDetailPage(
              onBackClicked: () {
                setState(() {
                  index = 0;
                });
              },
            ),
            MyProfilePage(
              setIndexPage: (i) {
                setState(() {
                  index = i;
                });
              },
            )
          ])),
          bottomNavigationBar: CustomBottomNav(
            index: index,
            onTap: (i) {
              context.read<HomeBloc>().add(HomeInitEvent());
              if (i==2){
              context.read<CartBloc>().add(CartInitEvent());
              }
              setState(() {
                index = i;
              });
            },
          ),
        );
  }
}
