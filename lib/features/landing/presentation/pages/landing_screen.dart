import 'package:decorizer/common/dart/extension/color_extension.dart';
import 'package:decorizer/common/dart/extension/context_extension.dart';
import 'package:decorizer/common/dart/extension/data_types/int.dart';
import 'package:decorizer/common/dart/extension/widget.dart';
import 'package:decorizer/common/resources/gen/locale_keys.g.dart';
import 'package:decorizer/common/theme/color/app_colors.dart';
import 'package:decorizer/common/util/intent_util.dart';
import 'package:decorizer/common/widget/animations/fade.dart';
import 'package:decorizer/common/widget/animations/slide.dart';
import 'package:decorizer/features/landing/presentation/widgets/auto_slide_images.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../common/resources/gen/assets.gen.dart';
import '../../../../common/widget/app/app_image.dart';
import '../widgets/icon_text_row.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.deviceWidth;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeAppearWrapper(
                  duration: Duration(milliseconds: 800),
                  child: SlideWrapper(
                    duration: Duration(milliseconds: 800),
                    slideDirection: SlideDirection.start,
                    child: AppImage(
                      path: Assets.image.png.me.path,
                      width: 200,
                      height: 200,
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
                            width: 26,
                            colorFilter: AppColors.text.colorFilter,
                          ),
                        ).clickable(_openLinkedIn),
                        8.gap,
                        SlideWrapper(
                          duration: Duration(milliseconds: 1000),
                          slideDirection: SlideDirection.down,
                          child: SvgPicture.asset(
                            Assets.image.svg.github.path,
                            width: 26,
                            colorFilter: AppColors.text.colorFilter,
                          ),
                        ).clickable(_openGitHub),
                      ],
                    )
                  ],
                )
              ],
            ).marginStart(12).marginTop(12),
            AutoSlidingImages(isRtl: true, imagePaths: [
              Assets.image.png.hyn1.path,
              Assets.image.png.hyn2.path,
              Assets.image.png.hyn3.path,
              Assets.image.png.hyn4.path,
              Assets.image.png.hyn5.path,
              Assets.image.png.hyn6.path,
              Assets.image.png.hyn7.path,
            ]).withTitle(context: context, title: 'HYN').marginTop(12),
            AutoSlidingImages(isRtl: false, imagePaths: [
              Assets.image.png.hyn1.path,
              Assets.image.png.hyn2.path,
              Assets.image.png.hyn3.path,
              Assets.image.png.hyn4.path,
              Assets.image.png.hyn5.path,
              Assets.image.png.hyn6.path,
              Assets.image.png.hyn7.path,
            ]).withTitle(context: context, title: 'HYN').marginTop(12),
            50.gap,
          ],
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
