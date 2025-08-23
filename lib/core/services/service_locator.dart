import 'package:get_it/get_it.dart';
import 'package:meals_app/core/helper/cach_helper.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  getIt.registerLazySingleton<CacheHelper>(() => CacheHelper());
}
