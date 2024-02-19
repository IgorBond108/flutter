import 'package:sindbad/model/cart_responce.dart';

class CartState {}
class CartLoadingState extends CartState{}
class CartLoadedState extends CartState{
  final CartResponceModel cartResponceModel;

  CartLoadedState({required this.cartResponceModel});
}