import 'package:abstraction_unit_test_get_it/services/api/api.dart';
import 'package:abstraction_unit_test_get_it/services/http_api.dart';
import 'package:abstraction_unit_test_get_it/services/localstorage_service.dart';
import 'package:abstraction_unit_test_get_it/services/storage/storage_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<Api>(() => HttpApi());
  locator.registerLazySingleton<StorageService>(() => LocalStorageService());
}
