import 'package:flutter/cupertino.dart';
import 'package:portfolio/common/dart/extension/data_types/int.dart';
import 'package:portfolio/common/dart/extension/widget.dart';
import 'package:portfolio/common/widget/animations/fade.dart';
import 'package:portfolio/data_generator.dart';

import 'auto_slide_images.dart';

class SlidingAppsSection extends StatelessWidget {
  const SlidingAppsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          FadeAppearWrapper(
            duration: const Duration(milliseconds: 800),
            child: AutoSlidingImages(
                    isRtl: false, imagePaths: DataGenerator.offeruImages)
                .withTitle(context: context, title: 'OfferU')
                .marginTop(12),
          ),
          FadeAppearWrapper(
            duration: const Duration(milliseconds: 1000),
            child: AutoSlidingImages(
                    isRtl: true, imagePaths: DataGenerator.hynImages)
                .withTitle(context: context, title: 'HYN')
                .marginTop(12),
          ),
          FadeAppearWrapper(
            duration: const Duration(milliseconds: 1200),
            child: AutoSlidingImages(
                    isRtl: false, imagePaths: DataGenerator.wasytkImages)
                .withTitle(
                  context: context,
                  title: 'Wasytk',
                )
                .marginTop(12),
          ),
          40.gap,
        ],
      ),
    );
  }
}
