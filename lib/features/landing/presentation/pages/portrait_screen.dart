import 'package:flutter/material.dart';
import 'package:portfolio/common/dart/extension/widget.dart';

class PortraitScreen extends StatelessWidget {
  const PortraitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Wrap(
          children: [
            Text(
              'this portfolio currently works on landscape only, please rotate your device ',
              textAlign: TextAlign.center,
            ).marginHorizontal(12),
          ],
        ),
      ),
    );
  }
}
