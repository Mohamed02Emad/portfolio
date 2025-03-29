import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/common/dart/extension/color_extension.dart';
import 'package:portfolio/common/dart/extension/context_extension.dart';
import 'package:portfolio/common/dart/extension/data_types/int.dart';
import 'package:portfolio/common/dart/extension/widget.dart';

import '../../../../../common/resources/gen/assets.gen.dart';
import '../../../../../common/resources/gen/locale_keys.g.dart';
import '../../../../../common/theme/color/app_colors.dart';
import '../../../../../common/util/intent_util.dart';
import '../../../../../common/util/responsive_util.dart';
import '../../../../../common/widget/animated_glowing_wrapper.dart';
import '../../../../../common/widget/animations/fade.dart';
import '../../../../../common/widget/animations/slide.dart';
import '../../../../../common/widget/app/app_image.dart';
import '../icon_text_row.dart';
import '../language_level.dart';

class InfoLandingSection extends StatelessWidget {
  const InfoLandingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final DeviceType deviceType = context.deviceType;
    final double imageSize = switch (deviceType) {
      DeviceType.mobile => 110,
      DeviceType.tablet => 140,
      DeviceType.desktop => 160,
    };
    final double socialSize = switch (deviceType) {
      DeviceType.mobile => 22,
      DeviceType.tablet => 24,
      DeviceType.desktop => 26,
    };
    return Container(
      decoration: BoxDecoration(
          color: AppColors.surface, borderRadius: 15.borderRadius),
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      child: AnimatedGlowingWrapper(
        speed: 0.58,
        child: AnimatedGlowingWrapper(
          speed: 0.46,
          child: AnimatedGlowingWrapper(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FadeAppearWrapper(
                duration: Duration(milliseconds: 800),
                child: SlideWrapper(
                  duration: Duration(milliseconds: 800),
                  slideDirection: SlideDirection.start,
                  child: AnimatedGlowingWrapper(
                    child: AppImage(
                      path: Assets.image.png.me.path,
                      width: imageSize,
                      height: imageSize,
                      radius: 16,
                      borderColor: AppColors.text,
                    ),
                  ),
                ),
              ),
              12.gap,
              SlideWrapper(
                duration: Duration(milliseconds: 800),
                slideDirection: SlideDirection.end,
                child: FadeAppearWrapper(
                  duration: Duration(milliseconds: 800),
                  child: Text(
                    context.tr(
                      LocaleKeys.portfolio_my_name,
                    ),
                    style: context.textStyle,
                  ),
                ),
              ),
              4.gap,
              IconTextRow(
                icon: Assets.image.svg.code.path,
                delay: 200,
                text: context.tr(
                  LocaleKeys.portfolio_tracks,
                ),
              ).marginEnd(20),
              6.gap,
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
              ),
              const Spacer(),
              LanguageLevel(
                language: 'English',
                level: 3,
              ),
              4.gap,
              LanguageLevel(
                language: 'Arabic',
                level: 5,
              ),
              40.gap,
            ],
          ).marginHorizontal(8).marginTop(12)),
        ),
      ),
    );
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
