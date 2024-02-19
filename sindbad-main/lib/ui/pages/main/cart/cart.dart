import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sindbad/bloc/cart/bloc.dart';
import 'package:sindbad/bloc/cart/event.dart';
import 'package:sindbad/bloc/cart/state.dart';
import 'package:sindbad/ui/widget/btn.dart';
import 'package:sindbad/ui/widget/cart.dart';
import 'package:sindbad/utils/color.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.arrow_back,
                weight: 30,
              ),
              Spacer(),
              Text('Корзина'),
              Spacer(),
              SizedBox(
                width: 30,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/ic_location.png',
                height: 20,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Пункт выдачи',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Text('Москва, Пушкарев переулок, 16')
                ],
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
              )
            ],
          ),
        ),
        Container(
          color: Colors.grey.withOpacity(0.5),
          height: 2,
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
        ),
        BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoadedState){
            return Expanded(
                child: ListView.builder(
                    itemCount: state.cartResponceModel.results?.length,
                    itemBuilder: (cntx, index) {
                      var cartItem = state.cartResponceModel.results?[index];
                      if (cartItem !=null){
                      return Padding(
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                        child: Dismissible(
                          direction: DismissDirection.endToStart,
                          key: Key('$index'),
                          child: CartCard(cart: cartItem,),
                          onDismissed: (d) {
                            context.read<CartBloc>().add(CartRemoveEvent(id: cartItem.id!));
                          },
                          background: Container(
                            padding: EdgeInsets.all(20),
                            alignment: Alignment.centerRight,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.red),
                            child: Icon(
                              Icons.delete_forever_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                      } else {
                        return SizedBox.shrink();
                      }
                    }));
            } else {
              return Expanded(child: Center(child: SizedBox(width: 40,height: 40, child: CircularProgressIndicator()),));
            }
          }
        ),
        MButton(
          onTap: () {},
          text: 'К оформлению\n17 498 ₽',
          bgColor: MColor.blue,
          margin: EdgeInsets.fromLTRB(40, 0, 40, 20),
        )
      ],
    );
  }
}
