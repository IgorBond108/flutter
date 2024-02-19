import 'package:flutter/material.dart';
import 'package:sindbad/model/product_responce.dart';
import 'package:sindbad/utils/string.dart';

class ProductCard extends StatelessWidget{
  final Results product;

  const ProductCard({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Stack(children: [
        ClipRRect(borderRadius: BorderRadius.circular(8), child: Image.network(product.productImages?.isNotEmpty==true? product.productImages!.first.image!:MString.fakeImageLink, height: 200, fit: BoxFit.cover,)),
        Positioned(right: 0, child: Container(padding: const EdgeInsets.all(6), margin: EdgeInsets.only(top: 10), decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.horizontal(left: Radius.circular(8))), child: Text('-60%', style: TextStyle(color: Colors.white),),))
      ],),
      Container(alignment: Alignment.centerLeft, child: Text(product.title??'')),
      Row(children: [Text('${product.salePrice} ₽ '), Text('${product.discountPrice} ₽', style: TextStyle(decoration:TextDecoration.lineThrough),)],),
      Row(children: [Image.asset('assets/ic_star.png', height: 14,), Text(' ${product.rate}'), Center(child: Container(margin: EdgeInsets.fromLTRB(4, 0, 4, 0), decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey), width: 5, height: 5,),), Text('${product.reviewsCount} оценок')],),
    ],);
  }
}