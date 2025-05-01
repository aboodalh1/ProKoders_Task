import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:prokoders_login_task/features/items/data/repos/item_repository_implementation.dart';

import 'network/api_service.dart';


final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton(DioHelper(Dio()));
  getIt.registerSingleton<ItemRepositoryImplementation>(ItemRepositoryImplementation(getIt.get<DioHelper>()));
}