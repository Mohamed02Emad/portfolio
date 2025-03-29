import 'package:flutter/material.dart';
import 'package:portfolio/common/dart/extension/data_types/int.dart';
import 'package:portfolio/features/landing/presentation/widgets/landing/info_landing_section.dart';

import '../widgets/landing/navigation_layout.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const InfoLandingSection(),
          8.gap,
          Expanded(
            child: NavigationLayout(),
          ),
        ],
      ),
    );
  }
}
