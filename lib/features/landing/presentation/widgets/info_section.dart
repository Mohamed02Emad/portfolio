import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/common/dart/extension/color_extension.dart';
import 'package:portfolio/common/dart/extension/context_extension.dart';
import 'package:portfolio/common/dart/extension/data_types/int.dart';
import 'package:portfolio/common/dart/extension/widget.dart';
import 'package:portfolio/common/util/responsive_util.dart';

import '../../../../common/resources/gen/assets.gen.dart';
import '../../../../common/resources/gen/locale_keys.g.dart';
import '../../../../common/theme/color/app_colors.dart';
import '../../../../common/util/intent_util.dart';
import '../../../../common/widget/animations/fade.dart';
import '../../../../common/widget/animations/slide.dart';
import '../../../../common/widget/app/app_image.dart';
import 'icon_text_row.dart';

class InfoSection extends StatelessWidget {
  const InfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    final DeviceType deviceType = context.deviceType;
    final double imageSize = switch (deviceType) {
      DeviceType.mobile => 120,
      DeviceType.tablet => 160,
      DeviceType.desktop => 200,
    };
    final double socialSize = switch (deviceType) {
      DeviceType.mobile => 22,
      DeviceType.tablet => 24,
      DeviceType.desktop => 26,
    };
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeAppearWrapper(
          duration: Duration(milliseconds: 800),
          child: SlideWrapper(
            duration: Duration(milliseconds: 800),
            slideDirection: SlideDirection.start,
            child: AppImage(
              path: Assets.image.png.me.path,
              width: imageSize,
              height: imageSize,
              radius: 16,
              borderColor: AppColors.text,
            ),
          ),
        ),
        6.gap,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            6.gap,
            IconTextRow(
              icon: Assets.image.svg.profile2.path,
              delay: 0,
              text: context.tr(
                LocaleKeys.portfolio_my_name,
              ),
            ),
            4.gap,
            IconTextRow(
              icon: Assets.image.svg.location.path,
              delay: 200,
              text: context.tr(
                LocaleKeys.portfolio_current_location,
              ),
            ).marginEnd(20).clickable(_openOnMap),
            4.gap,
            IconTextRow(
              icon: Assets.image.svg.code.path,
              delay: 200,
              text: context.tr(
                LocaleKeys.portfolio_tracks,
              ),
            ).marginEnd(20),
            20.gap,
            Row(
              children: [
                SlideWrapper(
                  duration: Duration(milliseconds: 800),
                  slideDirection: SlideDirection.down,
                  child: SvgPicture.asset(
                    Assets.image.svg.linkedIn.path,
                    width: socialSize,
                    colorFilter: AppColors.text.colorFilter,
                  ),
                ).clickable(_openLinkedIn),
                8.gap,
                SlideWrapper(
                  duration: Duration(milliseconds: 1000),
                  slideDirection: SlideDirection.down,
                  child: SvgPicture.asset(
                    Assets.image.svg.github.path,
                    width: socialSize,
                    colorFilter: AppColors.text.colorFilter,
                  ),
                ).clickable(_openGitHub),
              ],
            )
          ],
        )
      ],
    ).marginStart(12).marginTop(12);
  }

  void _openOnMap() {
    openMapsApp(31.040296, 31.378467);
  }

  void _openLinkedIn() {
    openWebIntent(url: 'https://www.linkedin.com/in/mohamed-emad-184782209/');
  }

  void _openGitHub() {
    openWebIntent(url: 'https://github.com/Mohamed02Emad');
  }
}
