import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sindbad/bloc/cart/event.dart';
import 'package:sindbad/bloc/cart/state.dart';
import 'package:sindbad/model/cart_responce.dart';
import 'package:sindbad/repository/cart.dart';
import 'package:sindbad/utils/di.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoadingState()) {
    on<CartInitEvent>(_getCart);
    on<CartAddEvent>(_addCart);
    on<CartRemoveEvent>(_removeCart);
  }

  _getCart(CartInitEvent event, emit) async {
    emit(CartLoadingState());
    var result = await getIt<CartRepository>().getCart();
    if (result is CartResponceModel) {
      emit(CartLoadedState(cartResponceModel: result));
    }
  }
  _addCart(CartAddEvent event, emit) async {
    var result = await getIt<CartRepository>().addCart(event.productId, event.quantity);
    if (result is CartResponceModel) {
      emit(CartLoadedState(cartResponceModel: result));
    }
  }
  _removeCart(CartRemoveEvent event, emit){
    getIt<CartRepository>().removeCart(event.id);
  }
}
