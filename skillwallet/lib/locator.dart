import 'package:get_it/get_it.dart';
import 'package:skillwallet/services/LocalStorageService.dart';
import 'package:skillwallet/services/NavigationService.dart';

GetIt locator = GetIt.instance;

Future setupLocator() async {
  var instance = await LocalStorageService.getInstance();

  locator.registerSingleton<LocalStorageService>(instance);
  locator.registerLazySingleton(() => NavigationService());
}
