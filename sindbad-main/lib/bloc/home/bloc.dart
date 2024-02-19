import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sindbad/bloc/home/event.dart';
import 'package:sindbad/bloc/home/state.dart';
import 'package:sindbad/model/product_detail.dart';
import 'package:sindbad/model/product_responce.dart';
import 'package:sindbad/repository/home.dart';
import 'package:sindbad/utils/di.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState>{
  HomeBloc():super(HomeLoadingState()){
    on<HomeInitEvent>(_getProducts);
    on<HomeOpenDetailEvent>(_getProduct);
  }

  _getProducts(HomeInitEvent event, emit) async{
    var result = await getIt<HomeRepository>().getProducts();
    if (result is ProductResponceModel){
      emit(HomeLoadedState(productResponceModel: result));
    }
  }
  _getProduct(HomeOpenDetailEvent event, emit) async{
    emit(HomeDetailLoadingState());
    var result = await getIt<HomeRepository>().getProduct(event.id);
    if (result is ProductDetailModel){
      emit(HomeDetailLoadedState(productDetailModel: result, id: event.id));
    }
  }

}