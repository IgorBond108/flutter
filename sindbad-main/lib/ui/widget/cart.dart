import 'package:flutter/material.dart';
import 'package:sindbad/model/cart_responce.dart';
import 'package:sindbad/utils/color.dart';
import 'package:sindbad/utils/string.dart';

class CartCard extends StatefulWidget {
  final CartResults cart;

  const CartCard({super.key, required this.cart});
  @override
  State<StatefulWidget> createState() {
    return _CartCardState();
  }
}

class _CartCardState extends State<CartCard> {
  bool checked = false;
  int amount = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 15, 15, 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 20)
          ]),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Checkbox(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            value: checked,
            onChanged: (v) {
              setState(() {
                checked = v ?? false;
              });
            }),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            MString.fakeImageLink,
            height: 100,
            width: 70,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${widget.cart.product?.title}',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              Text('${widget.cart.product?.description}', maxLines: 1,),
              Row(
                children: [
                  Expanded(
                      child: Text(
                    '${widget.cart.product?.salePrice} ₽ ',
                    softWrap: true,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                  Expanded(
                      child: Text(
                    '${widget.cart.product?.discountPrice} ₽',
                    softWrap: true,
                    style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        decorationColor: Colors.grey),
                  )),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (amount > 0) amount--;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8)),
                          color: MColor.main),
                      child: Text(
                        '-',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(2, 0, 2, 0),
                    alignment: Alignment.center,
                    width: 50,
                    height: 30,
                    color: MColor.main,
                    child: Text(
                      '$amount',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        amount++;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8),
                              bottomRight: Radius.circular(8)),
                          color: MColor.main),
                      child: Text(
                        '+',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ]),
    );
  }
}
