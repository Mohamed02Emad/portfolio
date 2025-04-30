import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/common/dart/extension/widget.dart';
import 'package:portfolio/common/util/intent_util.dart';

import '../../../../../../common/resources/gen/assets.gen.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  Widget _contactButton({
    required String assetPath,
    required String label,
    required String value,
    required VoidCallback onPressed,
  }) {
    return Row(
      children: [
        SvgPicture.asset(
          assetPath,
          height: 24,
          width: 24,
        ),
        const SizedBox(width: 8),
        SelectableText("$label: $value"),
      ],
    ).marginHorizontal(12).marginVertical(20).clickable(onPressed, radius: 12);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
        ),
        const SizedBox(height: 40),
        _contactButton(
          assetPath: Assets.image.svg.email.path,
          label: "Email",
          value: "mohamed02emad02@gmail.com",
          onPressed: () => sendMail("mohamed02emad02@gmail.com"),
        ),
        _contactButton(
          assetPath: Assets.image.svg.whhats.path,
          label: "WhatsApp",
          value: "2011553813400",
          onPressed: () => openWhatsApp(number: "2011553813400"),
        ),
        _contactButton(
          assetPath: Assets.image.svg.linkedIn2.path,
          label: "LinkedIn",
          value: "https://www.linkedin.com/in/mohamed-emad-184782209/",
          onPressed: () => openWebIntent(
              url: "https://www.linkedin.com/in/mohamed-emad-184782209/"),
        ),
      ],
    ).marginHorizontal(12);
  }
}
