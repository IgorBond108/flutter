class HomeEvent {}

class HomeInitEvent extends HomeEvent {}
class HomeOpenDetailEvent extends HomeEvent {
  final int id;

  HomeOpenDetailEvent({required this.id});
}
class HomeSearchEvent extends HomeEvent {
  String query;
  HomeSearchEvent({
    required this.query,
  });
}
