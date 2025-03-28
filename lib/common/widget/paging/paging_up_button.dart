import 'package:flutter/material.dart';
import 'package:portfolio/common/dart/extension/widget.dart';

import '../../theme/color/app_colors.dart';

class PagingUpButton extends StatelessWidget {
  final bool showButton;
  final Function() onClick;
  const PagingUpButton(
      {super.key, required this.showButton, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return showButton
        ? Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Center(
              child: Icon(
                Icons.arrow_upward_rounded,
                color: Colors.white,
                size: 26,
              ),
            ).clickable(onClick, radius: 40),
          ).marginBottom(8).marginStart(8)
        : Container();
  }
}
