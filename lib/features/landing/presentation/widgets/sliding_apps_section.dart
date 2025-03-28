import 'package:flutter/cupertino.dart';
import 'package:portfolio/common/dart/extension/widget.dart';
import 'package:portfolio/data_generator.dart';

import 'auto_slide_images.dart';

class SlidingAppsSection extends StatelessWidget {
  const SlidingAppsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AutoSlidingImages(isRtl: false, imagePaths: DataGenerator.offeruImages)
            .withTitle(context: context, title: 'OfferU')
            .marginTop(12),
        AutoSlidingImages(isRtl: true, imagePaths: DataGenerator.hynImages)
            .withTitle(context: context, title: 'HYN')
            .marginTop(12),
      ],
    );
  }
}
