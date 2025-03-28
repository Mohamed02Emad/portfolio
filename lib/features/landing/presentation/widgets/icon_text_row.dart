import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/common/dart/extension/color_extension.dart';
import 'package:portfolio/common/dart/extension/context_extension.dart';
import 'package:portfolio/common/dart/extension/data_types/int.dart';
import 'package:portfolio/common/dart/extension/text_styles_extention.dart';
import 'package:portfolio/common/theme/color/app_colors.dart';
import 'package:portfolio/common/widget/animations/fade.dart';
import 'package:portfolio/common/widget/animations/slide.dart';

import '../../../../common/util/responsive_util.dart';

class IconTextRow extends StatelessWidget {
  final String icon, text;
  final int delay;

  const IconTextRow(
      {super.key, required this.icon, required this.text, required this.delay});

  @override
  Widget build(BuildContext context) {
    final DeviceType deviceType = context.deviceType;
    final double iconSize = switch (deviceType) {
      DeviceType.mobile => 18,
      DeviceType.tablet => 22,
      DeviceType.desktop => 24,
    };
    final textStyle = switch (deviceType) {
      DeviceType.mobile => context.textStyle?.s14,
      DeviceType.tablet => context.textStyle?.s16,
      DeviceType.desktop => context.textStyle?.s18,
    };
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SlideWrapper(
          duration: Duration(milliseconds: 800 + delay),
          slideDirection: SlideDirection.down,
          child: SvgPicture.asset(
            icon,
            width: iconSize,
            colorFilter: AppColors.text.colorFilter,
          ),
        ),
        4.gap,
        SlideWrapper(
          duration: Duration(milliseconds: 800 + delay),
          slideDirection: SlideDirection.end,
          child: FadeAppearWrapper(
            duration: Duration(milliseconds: 800 + delay),
            child: Text(
              text,
              style: textStyle,
            ),
          ),
        ),
      ],
    );
  }
}
