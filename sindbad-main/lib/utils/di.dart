import 'package:get_it/get_it.dart';
import 'package:sindbad/repository/auth.dart';
import 'package:sindbad/repository/cart.dart';
import 'package:sindbad/repository/category.dart';
import 'package:sindbad/repository/home.dart';
import 'package:sindbad/ui/widget/loading_dialog.dart';
import 'package:sindbad/utils/shared_pref.dart';
import 'package:sindbad/utils/string.dart';

final getIt = GetIt.I;

void setupDi() {
  getIt.registerSingleton<SharedPref>(SharedPref());
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository());
  getIt.registerLazySingleton<HomeRepository>(() => HomeRepository());
  getIt.registerLazySingleton<MString>(() => MString());
  getIt.registerLazySingleton<LoadingDialog>(() => LoadingDialog());
  getIt.registerLazySingleton<CategoryRepository>(() => CategoryRepository());
  getIt.registerLazySingleton<CartRepository>(() => CartRepository());
}
