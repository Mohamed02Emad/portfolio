import 'package:decorizer/common/constant/app_constants.dart';
import 'package:decorizer/common/dart/extension/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme/color/app_colors.dart';

class FloatingCard extends StatelessWidget {
  final Widget child;
  final Color? shadowColor, backgroundColor;
  final double shadowBlurRadius, shadowSpreadRadius;
  final double? radius;
  final EdgeInsetsGeometry? padding, margin;
  final Function()? onClick;

  const FloatingCard({
    super.key,
    required this.child,
    this.shadowColor,
    this.padding,
    this.radius,
    this.onClick,
    this.margin = EdgeInsets.zero,
    this.shadowBlurRadius = AppConstants.shadowBlurRadius,
    this.shadowSpreadRadius = AppConstants.shadowSpreadRadius,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.zero,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.onBackground,
        boxShadow: [
          BoxShadow(
            color: shadowColor ?? AppColors.shadowColor,
            blurRadius: shadowBlurRadius,
            spreadRadius: shadowSpreadRadius,
            offset: const Offset(0, AppConstants.cardElevation),
          )
        ],
        borderRadius: BorderRadius.all(
            Radius.circular(radius ?? AppConstants.mainCorner)),
      ),
      child: onClick == null
          ? Padding(
              padding: padding ?? EdgeInsets.all(8),
              child: child,
            )
          : Padding(
              padding: padding ?? EdgeInsets.all(8),
              child: child,
            ).clickable(onClick!, color: AppColors.text),
    );
  }
}
