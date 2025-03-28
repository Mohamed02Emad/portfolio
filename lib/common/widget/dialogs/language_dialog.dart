import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/common/dart/extension/context_extension.dart';
import 'package:portfolio/common/dart/extension/data_types/int.dart';
import 'package:portfolio/common/dart/extension/text_styles_extention.dart';
import 'package:portfolio/common/dart/extension/widget.dart';
import 'package:portfolio/common/language/language_enum.dart';
import 'package:portfolio/common/resources/gen/locale_keys.g.dart';
import 'package:portfolio/common/theme/color/app_colors.dart';

import '../app/app_button.dart';

class LanguageDialog extends StatefulWidget {
  const LanguageDialog({
    super.key,
  });

  @override
  State<LanguageDialog> createState() => _LanguageDialogState();
}

class _LanguageDialogState extends State<LanguageDialog> {
  LanguageEnum selectedLanguage = LanguageEnum.en;
  LanguageEnum? currentSelectedLanguage;

  @override
  void initState() {
    super.initState();
    selectedLanguage = LanguageEnum.en;
  }

  @override
  void didChangeDependencies() {
    if (currentSelectedLanguage != null) return;
    final currentLangString =
        EasyLocalization.of(context)?.currentLocale?.languageCode ?? 'en';
    currentSelectedLanguage =
        currentLangString == 'ar' ? LanguageEnum.ar : LanguageEnum.en;
    setState(() {
      selectedLanguage = currentSelectedLanguage!;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final scaledRadius = 12.borderRadius;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: scaledRadius,
      ),
      insetPadding: EdgeInsets.symmetric(horizontal: 16),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Material(
        borderRadius: scaledRadius,
        clipBehavior: Clip.antiAlias,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.onBackground,
            borderRadius: scaledRadius,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                child: Text(
                  LocaleKeys.common_language.tr(),
                  textAlign: TextAlign.center,
                  style: context.textStyle?.bold.s18,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  16.gap,
                  Expanded(
                    child: _LanguageCard(
                      language: LanguageEnum.ar,
                      isSelected: selectedLanguage == LanguageEnum.ar,
                      onSelected: _updateSelectedLanguage,
                    ),
                  ),
                  24.gap,
                  Expanded(
                    child: _LanguageCard(
                      language: LanguageEnum.en,
                      isSelected: selectedLanguage == LanguageEnum.en,
                      onSelected: _updateSelectedLanguage,
                    ),
                  ),
                  16.gap,
                ],
              ),
              SizedBox(
                height: 20,
              ),
              AppButton(
                  text: LocaleKeys.action_next.tr(),
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  onClick: () => _onChangeLanguage(context)),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onChangeLanguage(BuildContext context) async {
    currentSelectedLanguage = selectedLanguage;
    await context.setLocale(Locale(selectedLanguage.name));
    Navigator.pop(context);
  }

  _updateSelectedLanguage(LanguageEnum language) {
    setState(() {
      selectedLanguage = language;
    });
  }
}

class _LanguageCard extends StatelessWidget {
  final LanguageEnum language;
  final bool isSelected;
  final Function(LanguageEnum) onSelected;

  const _LanguageCard(
      {required this.language,
      required this.isSelected,
      required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.primary.withOpacity(0.05)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color: isSelected ? AppColors.primary : Colors.transparent,
                width: 1),
          ),
          child: Center(
            child: SvgPicture.asset(
              language.flagPath,
              height: 55,
            ),
          ).clickable(() => onSelected(language)),
        ),
        12.gap,
        Text(language.displayName),
      ],
    );
  }
}
