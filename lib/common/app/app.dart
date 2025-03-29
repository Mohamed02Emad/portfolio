import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/common/dart/extension/context_extension.dart';
import 'package:portfolio/common/theme/custom_theme.dart';
import 'package:portfolio/common/util/responsive_util.dart';
import 'package:portfolio/features/landing/presentation/pages/portrait_screen.dart';

import '../../features/landing/presentation/pages/landing_screen.dart';
import '../constant/size_config.dart';

BuildContext? appContext;

class App extends StatefulWidget {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static bool isForeground = true;

  const App({super.key});

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      SizeConfig().init(context);
      appContext ??= context;
      return MaterialApp(
          navigatorKey: App.navigatorKey,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          title: 'Mohamed Emad\'s Portfolio',
          theme: customTheme,
          debugShowCheckedModeBanner: false,
          home: context.deviceType == DeviceType.mobile
              ? const PortraitScreen()
              : const LandingScreen());
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        App.isForeground = true;
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        App.isForeground = false;
        break;
      case AppLifecycleState.detached:
        break;
      case AppLifecycleState.hidden:
        break;
    }
    super.didChangeAppLifecycleState(state);
  }
}
