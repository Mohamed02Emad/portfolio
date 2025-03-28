import 'package:flutter/material.dart';
import 'package:portfolio/common/theme/color/app_colors.dart';

class AppCheckBox extends StatelessWidget {
  final bool isChecked;
  final void Function(bool) onClick;
  final bool showBorders;
  final double size;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const AppCheckBox({
    required this.isChecked,
    required this.onClick,
    this.showBorders = true,
    this.size = 21.0,
    this.padding,
    this.margin,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      child: SizedBox(
        width: size,
        height: size,
        child: Checkbox(
          side: showBorders
              ? null
              : BorderSide(
                  color: AppColors.primary,
                  width: 1,
                ),
          value: isChecked,
          checkColor: AppColors.primary,
          activeColor: Colors.transparent,
          shape: showBorders
              ? null
              : RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: AppColors.primary),
                ),
          onChanged: (bool? value) {
            if (value != null) {
              onClick(value);
            }
          },
        ),
      ),
    );
  }
}
