import 'package:flutter/material.dart';
import 'package:portfolio/common/dart/extension/data_types/int.dart';
import 'package:portfolio/common/theme/color/app_colors.dart';
import 'package:portfolio/features/landing/presentation/widgets/landing/info_landing_section.dart';

import '../widgets/landing/navigation_layout.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.shadowColor,
              AppColors.hintText,
              AppColors.onPrimary,
              AppColors.shadowColor,
              AppColors.hintText,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Row(
          children: [
            const InfoLandingSection(),
            8.gap,
            Expanded(
              child: NavigationLayout(),
            ),
          ],
        ),
      ),
    );
  }
}
