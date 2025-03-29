import 'package:flutter/material.dart';
import 'package:portfolio/common/dart/extension/context_extension.dart';
import 'package:portfolio/common/dart/extension/data_types/int.dart';
import 'package:portfolio/common/theme/color/app_colors.dart';

class LanguageLevel extends StatelessWidget {
  final String language;
  final int level;

  const LanguageLevel({super.key, required this.language, required this.level});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(language, style: context.textStyle),
        8.gap,
        Row(
          children: List.generate(5, (index) {
            return Container(
              width: 10,
              height: 10,
              margin: EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: index < level ? AppColors.onPrimary : AppColors.hintText,
              ),
            );
          }),
        )
      ],
    );
  }
}
