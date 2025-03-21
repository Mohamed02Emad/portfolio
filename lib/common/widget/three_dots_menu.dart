import 'package:decorizer/common/theme/color/app_colors.dart';
import 'package:flutter/material.dart';

class ThreeDotsMenu extends StatelessWidget {
  final List<PopupMenuEntry<String>> actions;
  final Function(String)? onSelected;

  const ThreeDotsMenu({super.key, required this.actions, this.onSelected});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 26,
      width: 26,
      child: FittedBox(
        child: PopupMenuButton<String>(
          color: AppColors.onBackground,
          icon: const Icon(
            Icons.more_vert,
            size: 40,
          ),
          onSelected: (value) {
            if (onSelected != null) {
              onSelected!(value);
            }
          },
          itemBuilder: (BuildContext context) => actions,
        ),
      ),
    );
  }
}
