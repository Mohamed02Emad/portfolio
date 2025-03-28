import 'package:flutter/material.dart';
import 'package:portfolio/common/dart/extension/data_types/int.dart';
import 'package:portfolio/features/landing/presentation/widgets/info_section.dart';
import 'package:portfolio/features/landing/presentation/widgets/sliding_apps_section.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const InfoSection(),
            const SlidingAppsSection(),
            50.gap,
          ],
        ),
      ),
    );
  }
}
