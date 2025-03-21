import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';

initServices() async {
  await EasyLocalization.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}
