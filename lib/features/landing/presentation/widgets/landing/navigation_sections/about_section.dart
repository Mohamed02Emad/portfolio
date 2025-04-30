import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/common/dart/extension/context_extension.dart';
import 'package:portfolio/common/dart/extension/text_styles_extention.dart';
import 'package:portfolio/common/dart/extension/widget.dart';
import 'package:portfolio/common/resources/gen/locale_keys.g.dart';
import 'package:portfolio/common/widget/app/app_button.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 60),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: SelectableText(
                context.tr(LocaleKeys.about_about_me),
                style: context.textStyle?.bold.s16,
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        const SizedBox(height: 16),
        AppButton(
          onClick: () {
            const pdfPath = 'assets/files/Mohamed-Emad-Flutter-Developer.pdf';
            final pdfUrl = Uri.file(pdfPath);
            launchUrl(pdfUrl, mode: LaunchMode.externalApplication);
          },
          text: 'View Resume',
        ),
        const SizedBox(height: 62),
        SelectableText(
          'note : this portfolio is not finished yet',
          style: context.textStyle?.bold.s16,
        )
      ],
    ).marginHorizontal(12);
  }
}
