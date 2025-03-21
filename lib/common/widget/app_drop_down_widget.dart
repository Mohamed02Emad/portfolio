import 'package:decorizer/common/constant/app_constants.dart';
import 'package:decorizer/common/dart/extension/context_extension.dart';
import 'package:decorizer/common/dart/extension/text_styles_extention.dart';
import 'package:decorizer/common/theme/color/app_colors.dart';
import 'package:flutter/material.dart';

class AppDropDown<T> extends StatelessWidget {
  final String? title, hint;
  final TextStyle? titleStyle;
  final Widget? icon;
  final dynamic value, onChange;
  final List<DropdownMenuItem<T>> items;
  final double? linePadding, titlePadding;
  final Color? backgroundColor;
  final bool fullBorder, isEnabled;
  final EdgeInsetsGeometry margin;

  const AppDropDown({
    Key? key,
    this.icon,
    this.isEnabled = true,
    this.margin = EdgeInsets.zero,
    this.title,
    this.linePadding = 0,
    this.titlePadding,
    required this.hint,
    this.value,
    this.fullBorder = true,
    required this.onChange,
    required this.items,
    this.titleStyle,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (title != null)
            Padding(
              padding: EdgeInsets.only(
                  left: titlePadding ?? 0,
                  right: titlePadding ?? 0,
                  top: 4,
                  bottom: 6),
              child: Text(
                title!,
                style: titleStyle ??
                    TextStyle(
                        color: AppColors.text,
                        fontWeight: FontWeight.w800,
                        fontSize: 16),
              ),
            ),
          DropdownButtonFormField<T>(
            padding: EdgeInsets.zero,
            isExpanded: true,
            items: items,
            hint: hint != null
                ? Text(
                    hint!,
                    style: context.textStyle?.regular.s13
                        .setColor(AppColors.hintText),
                  )
                : null,
            value: value,
            onChanged: isEnabled ? onChange : null,
            style: TextStyle(color: AppColors.text, fontSize: 16),
            iconDisabledColor: isEnabled ? AppColors.text : AppColors.grey,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              border: fullBorder
                  ? OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(AppConstants.mainCorner),
                    )
                  : const UnderlineInputBorder(),
              filled: true,
              fillColor: backgroundColor ?? AppColors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
