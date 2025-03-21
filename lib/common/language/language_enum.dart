import '../resources/gen/assets.gen.dart';

enum LanguageEnum {
  ar,
  en;

  static LanguageEnum fromString(String language) {
    switch (language.toLowerCase()) {
      case 'ar':
      case 'arabic':
      case 'العربية':
        return LanguageEnum.ar;
      default:
        return LanguageEnum.en;
    }
  }
}

extension LanguageEnumExtension on LanguageEnum {
  String get displayName {
    switch (this) {
      case LanguageEnum.ar:
        return "العربية";
      case LanguageEnum.en:
        return "English";
    }
  }

  String get flagPath {
    switch (this) {
      case LanguageEnum.ar:
        return Assets.image.svg.egypt.path;
      case LanguageEnum.en:
        return Assets.image.svg.usa.path;
    }
  }

  bool get isRtl {
    return this == LanguageEnum.ar;
  }
}
