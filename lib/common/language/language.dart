import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../app/app.dart';

enum Language {
  arabic(Locale('ar'), 'assets/image/svg/egypt.svg'),
  english(Locale('en'), 'assets/image/svg/usa.svg');

  final Locale locale;
  final String flagPath;

  const Language(this.locale, this.flagPath);

  static Language find(String key) {
    return Language.values.asNameMap()[key] ?? Language.arabic;
  }
}

Language get currentLanguage => App.navigatorKey.currentContext == null
    ? Language.english
    : EasyLocalization.of(App.navigatorKey.currentContext!)
                ?.locale
                .languageCode ==
            'ar'
        ? Language.arabic
        : Language.english;

bool isArabic() => currentLanguage == Language.arabic;
