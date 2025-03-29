import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/features/landing/presentation/cubits/navigation/navigation_cubit.dart';

import 'common/app/app.dart';
import 'common/app/init_services.dart';
import 'common/di/injection_container.dart';

void main() async {
  await configureDependencies();
  await initServices();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      fallbackLocale: const Locale('en'),
      startLocale: const Locale('en'),
      path: 'assets/translations',
      useOnlyLangCode: true,
      child: BlocProvider(
        create: (context) => NavigationCubit(),
        child: const App(),
      ),
    ),
  );
}
