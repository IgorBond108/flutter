import 'package:sindbad/model/category_responce.dart';

class CategoryState {}
class CategoryLoadingState extends CategoryState{}
class CategoryLoadedState extends CategoryState{
  final CategoryResponceMoodel categoryResponceMoodel;

  CategoryLoadedState({required this.categoryResponceMoodel});
}