import 'package:decorizer/common/dart/extension/color_extension.dart';
import 'package:decorizer/common/dart/extension/context_extension.dart';
import 'package:decorizer/common/dart/extension/data_types/int.dart';
import 'package:decorizer/common/dart/extension/text_styles_extention.dart';
import 'package:decorizer/common/theme/color/app_colors.dart';
import 'package:decorizer/common/widget/animations/fade.dart';
import 'package:decorizer/common/widget/animations/slide.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconTextRow extends StatelessWidget {
  final String icon, text;
  final int delay;

  const IconTextRow(
      {super.key, required this.icon, required this.text, required this.delay});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SlideWrapper(
          duration: Duration(milliseconds: 800 + delay),
          slideDirection: SlideDirection.down,
          child: SvgPicture.asset(
            icon,
            width: 24,
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
              style: context.textStyle?.s18,
            ),
          ),
        ),
      ],
    );
  }
}
