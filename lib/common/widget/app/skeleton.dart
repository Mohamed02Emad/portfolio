import 'package:flutter/material.dart';

class Skeleton extends StatefulWidget {
  final double width;
  final double height;
  final double radius;

  const Skeleton({
    super.key,
    required this.width,
    required this.height,
    this.radius = 0.0,
  });

  @override
  State<Skeleton> createState() => _SkeletonState();
}

class _SkeletonState extends State<Skeleton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _shimmerAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    _shimmerAnimation = Tween<double>(begin: -2.0, end: 2.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const  lightColor= Color.fromARGB(255, 241, 241, 241);
    const darkColor = Color.fromARGB(255, 231, 231, 231);
    return AnimatedBuilder(
      animation: _shimmerAnimation,
      builder: (context, child) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(widget.radius),
          child: Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  darkColor,
                  lightColor,
                  darkColor,
                ],
                stops: const [0.1, 0.5, 0.9],
                begin: Alignment(_shimmerAnimation.value, 0.27),
                end: Alignment(_shimmerAnimation.value + 1.0, 0.0),
              ),
            ),
          ),
        );
      },
    );
  }
}
