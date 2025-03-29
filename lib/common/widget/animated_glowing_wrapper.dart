import 'package:flutter/material.dart';
import 'package:portfolio/common/dart/extension/data_types/int.dart';
import 'package:portfolio/common/dart/extension/offset.dart';
import 'package:portfolio/common/theme/color/app_colors.dart';

class AnimatedGlowingWrapper extends StatefulWidget {
  final Widget child;
  final double speed;

  const AnimatedGlowingWrapper(
      {super.key, required this.child, this.speed = 0.64});

  @override
  State<AnimatedGlowingWrapper> createState() => _AnimatedGlowingWrapperState();
}

class _AnimatedGlowingWrapperState extends State<AnimatedGlowingWrapper> {
  final ValueNotifier<Offset> currentGlowPosition =
      ValueNotifier(Offset(-4, -4));

  late final Size size;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final renderBox = context.findRenderObject() as RenderBox;
      size = renderBox.size;
      _startAnimatingOffset();
    });
    super.initState();
  }

  @override
  void dispose() {
    currentGlowPosition.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        widget.child,
        ValueListenableBuilder(
          valueListenable: currentGlowPosition,
          builder: (context, offset, child) => PositionedDirectional(
            top: offset.dy,
            start: offset.dx,
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.onPrimary, borderRadius: 8.borderRadius),
              width: 8,
              height: 8,
            ),
          ),
        ),
      ],
    );
  }

  _startAnimatingOffset() async {
    while (mounted) {
      await _animateTopBar();
      await _animateEndBar();
      await _animateBottomBar();
      await _animateStartBar();
    }
  }

  Future<void> _animateTopBar() async {
    double steps = size.width / widget.speed;
    while (steps > 0) {
      steps -= 1;
      await Future.delayed(Duration(milliseconds: widget.speed.toInt() * 100));
      final currentDx = currentGlowPosition.value.dx;
      final newOffset =
          currentGlowPosition.value.copyWith(dx: currentDx + widget.speed);
      print("Mohamed : new offset is ${newOffset.toString()}");

      currentGlowPosition.value = newOffset;
    }
  }

  Future<void> _animateEndBar() async {
    double steps = size.height / widget.speed;
    while (steps > 0) {
      steps -= 1;
      await Future.delayed(Duration(milliseconds: widget.speed.toInt() * 100));
      final currentDy = currentGlowPosition.value.dy;
      final newOffset =
          currentGlowPosition.value.copyWith(dy: currentDy + widget.speed);
      print("Mohamed : new offset is ${newOffset.toString()}");
      currentGlowPosition.value = newOffset;
    }
  }

  Future<void> _animateBottomBar() async {
    double steps = size.width / widget.speed;
    while (steps > 0) {
      steps -= 1;
      await Future.delayed(Duration(milliseconds: widget.speed.toInt() * 100));
      final currentDx = currentGlowPosition.value.dx;
      final newOffset =
          currentGlowPosition.value.copyWith(dx: currentDx - widget.speed);
      print("Mohamed : new offset is ${newOffset.toString()}");
      currentGlowPosition.value = newOffset;
    }
  }

  Future<void> _animateStartBar() async {
    double steps = size.height / widget.speed;
    while (steps > 0) {
      steps -= 1;
      await Future.delayed(Duration(milliseconds: widget.speed.toInt() * 100));
      final currentDy = currentGlowPosition.value.dy;
      final newOffset =
          currentGlowPosition.value.copyWith(dy: currentDy - widget.speed);
      print("Mohamed : new offset is ${newOffset.toString()}");
      currentGlowPosition.value = newOffset;
    }
  }
}
