import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:portfolio/common/di/injection_container.config.dart';

final sl = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies() async {
  sl.allowReassignment = true;
  // core
  sl.pushNewScope(init: (_) {
    sl.init();
  });
}

void injectFCMToken(String? fcmToken) {
  if (sl.isRegistered(instance: fcmToken, instanceName: 'fcmToken')) {
    sl.unregister(instanceName: 'fcmToken');
  }
  sl.registerLazySingleton<String>(() => fcmToken ?? '',
      instanceName: 'fcmToken');
}
