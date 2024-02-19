class CartEvent {}

class CartInitEvent extends CartEvent {}
class CartRemoveEvent extends CartEvent {
  final int id;

  CartRemoveEvent({required this.id});
}
class CartAddEvent extends CartEvent {
  int productId;
  int quantity;
  CartAddEvent({
    required this.productId,
    required this.quantity,
  });
}

