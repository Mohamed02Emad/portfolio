import 'package:flutter/material.dart';

class FloatingMouseEffect extends StatefulWidget {
  final Widget Function(bool isHovered) builder;

  const FloatingMouseEffect({super.key, required this.builder});

  @override
  State<FloatingMouseEffect> createState() => _FloatingMouseEffectState();
}

class _FloatingMouseEffectState extends State<FloatingMouseEffect> {
  ValueNotifier<bool> isHovered = ValueNotifier(false);

  @override
  void dispose() {
    isHovered.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => isHovered.value = true,
      onExit: (_) => isHovered.value = false,
      child: ValueListenableBuilder(
        valueListenable: isHovered,
        builder: (context, value, child) => widget.builder(value),
      ),
    );
  }
}
