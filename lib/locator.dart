import 'package:get_it/get_it.dart';
import 'package:my_portfolio/services/url_launcher_services.dart';

final GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton(() => UrlLauncherService.getInstance());
}
