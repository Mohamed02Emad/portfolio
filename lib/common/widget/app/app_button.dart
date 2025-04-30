import 'package:flutter/material.dart';
import 'package:portfolio/common/dart/extension/context_extension.dart';
import 'package:portfolio/common/widget/dynamic_container.dart';

import '../../theme/color/app_colors.dart';

class AppButton extends StatelessWidget {
  final String text;
  final double? height, fontSize;
  final bool isWrapContent, isBordered;
  final Color? loadingColor,
      iconTint,
      textColor,
      rippleColor,
      backgroundColor,
      borderColor;
  final IconData? icon;
  final Widget? leadingWidget;
  final Function()? onClick;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry margin;

  AppButton({
    required this.text,
    this.borderColor,
    this.margin = EdgeInsets.zero,
    this.backgroundColor,
    this.isBordered = false,
    required this.onClick,
    this.rippleColor,
    this.loadingColor,
    this.textColor,
    this.isWrapContent = false,
    this.icon,
    this.textStyle,
    super.key,
    this.iconTint,
    this.leadingWidget,
    this.height,
    this.fontSize = 18,
  });

  final radius = BorderRadius.circular(8);
  final innerPadding = EdgeInsets.symmetric(horizontal: 16, vertical: 4);
  final marginHorizontal = EdgeInsets.symmetric(horizontal: 16);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Material(
        borderRadius: radius,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          splashColor: rippleColor ?? AppColors.primary,
          borderRadius: radius,
          onTap: onClick == null
              ? null
              : () {
                  context.closeKeyboard();
                  onClick!();
                },
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: radius,
              color: onClick == null
                  ? Colors.grey
                  : backgroundColor ?? AppColors.onPrimary,
              border: isBordered
                  ? Border.all(
                      width: 2, color: borderColor ?? AppColors.primary)
                  : null,
            ),
            child: Row(
              mainAxisSize:
                  !isWrapContent ? MainAxisSize.max : MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DynamicContainer(
                  padding: innerPadding,
                  child: SizedBox(
                    height: height ?? 38,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            children: [
                              icon != null
                                  ? Icon(
                                      icon,
                                      color: iconTint,
                                      size: 24,
                                    )
                                  : const SizedBox(),
                              leadingWidget != null
                                  ? leadingWidget!
                                  : const SizedBox(),
                              icon != null || leadingWidget != null
                                  ? SizedBox(
                                      width: 5,
                                    )
                                  : const SizedBox(),
                              Text(
                                text,
                                style: textStyle ??
                                    TextStyle(
                                      color: textColor ??
                                          (isBordered
                                              ? borderColor
                                              : AppColors.black),
                                      fontWeight: FontWeight.w500,
                                      fontSize: fontSize ?? 14,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
