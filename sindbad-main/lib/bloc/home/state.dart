import 'package:sindbad/model/product_detail.dart';
import 'package:sindbad/model/product_responce.dart';

class HomeState {
  get productResponceModel => null;
}

class HomeLoadingState extends HomeState {}

class HomeDetailLoadingState extends HomeState {}

class HomeDetailLoadedState extends HomeState {
  final ProductDetailModel productDetailModel;
  final int id;

  HomeDetailLoadedState({required this.productDetailModel, required this.id});
}

class HomeLoadedState extends HomeState {
  final ProductResponceModel productResponceModel;

  HomeLoadedState({required this.productResponceModel});
}
