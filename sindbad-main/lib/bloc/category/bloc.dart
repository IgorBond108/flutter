import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sindbad/bloc/category/event.dart';
import 'package:sindbad/bloc/category/state.dart';
import 'package:sindbad/model/category_responce.dart';
import 'package:sindbad/repository/category.dart';
import 'package:sindbad/utils/di.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryLoadingState()) {
    on<CategoryInitEvent>(_getCategories);
  }

  _getCategories(CategoryInitEvent event, emit) async {
    var result = await getIt<CategoryRepository>().getCategory();
    if (result is CategoryResponceMoodel) {
      emit(CategoryLoadedState(categoryResponceMoodel: result));
    }
  }
}
