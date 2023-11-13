import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';

import 'services/client/client.dart';
import 'services/search_service.dart';
import 'services/storage_service.dart';

GetIt locator = GetIt.instance;

setupServiceLocator() async {
  locator.allowReassignment = true;

  await GetStorage.init();
  final box = GetStorage();
  final storageService = StorageService(box);
  locator.registerSingleton<StorageService>(storageService);

  final dio = DioClient.instance;

  locator.registerSingleton<DioClient>(dio);
  // locator.registerSingleton<ServiceRepository>(ServiceRepositoryImpl(locator()));

  // Storage Service instance
  // locator.registerLazySingleton<StorageService>(() => StorageService(injector()));
  locator.registerSingleton<SearchService>(SearchService(locator()));
}

//
// onPressed: () {
//   AuthService auth = locator<AuthService>();
//   ServiceRepository storageService = locator<ServiceRepository>();
//   storageService.setValue('test', 'ddasdasd');
//   print(storageService.getValue('test'));
// }