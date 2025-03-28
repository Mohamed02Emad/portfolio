import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/common/dart/extension/context_extension.dart';

import '../../../../common/resources/gen/assets.gen.dart';
import '../../../../common/util/responsive_util.dart';

class AutoSlidingImages extends StatefulWidget {
  final List<AssetGenImage> imagePaths;
  final AxisDirection direction;
  final double? imageHeight;
  final double? viewportFraction;
  final double spacing;
  final Duration autoPlayInterval;
  final Duration animationDuration;
  final bool isRtl;

  const AutoSlidingImages({
    super.key,
    required this.imagePaths,
    this.direction = AxisDirection.left,
    this.imageHeight,
    this.viewportFraction,
    this.spacing = 8,
    this.isRtl = false,
    this.autoPlayInterval = const Duration(seconds: 4),
    this.animationDuration = const Duration(seconds: 4),
  });

  @override
  _AutoSlidingImagesState createState() => _AutoSlidingImagesState();
}

class _AutoSlidingImagesState extends State<AutoSlidingImages> {
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  int _currentIndex = 0;
  bool _isHovering = false;
  int? _hoveredIndex;

  @override
  Widget build(BuildContext context) {
    if (widget.imagePaths.isEmpty) {
      return const SizedBox();
    }
    final DeviceType deviceType = context.deviceType;

    final double viewPortFraction = widget.viewportFraction == null
        ? switch (deviceType) {
            DeviceType.mobile => 0.18,
            DeviceType.tablet => 0.16,
            DeviceType.desktop => 0.14,
          }
        : widget.viewportFraction!;

    final double imageHeight = widget.imageHeight == null
        ? switch (deviceType) {
            DeviceType.mobile => 120,
            DeviceType.tablet => 140,
            DeviceType.desktop => 300,
          }
        : widget.imageHeight!;

    return Directionality(
      textDirection: widget.isRtl ? TextDirection.rtl : TextDirection.ltr,
      child: CarouselSlider.builder(
        carouselController: _carouselController,
        options: CarouselOptions(
          height: imageHeight,
          viewportFraction: viewPortFraction,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: widget.direction == AxisDirection.right,
          autoPlay: true,
          autoPlayInterval: widget.autoPlayInterval,
          autoPlayAnimationDuration: widget.animationDuration,
          autoPlayCurve: Curves.easeInOut,
          enlargeCenterPage: false,
          clipBehavior: Clip.none,
          pauseAutoPlayOnTouch: true,
          onPageChanged: (index, reason) {
            setState(() {
              _currentIndex = index;
            });
          },
          scrollDirection: Axis.horizontal,
        ),
        itemCount: widget.imagePaths.length,
        itemBuilder: (context, index, realIndex) {
          final isHovered = _hoveredIndex == index && _isHovering;
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: widget.spacing / 2),
            child: MouseRegion(
              onEnter: (_) => setState(() {
                _isHovering = true;
                _hoveredIndex = index;
              }),
              onExit: (_) => setState(() {
                if (_hoveredIndex == index) {
                  _hoveredIndex = null;
                }
              }),
              child: AnimatedScale(
                scale: isHovered ? 1.06 : 1.0,
                duration: const Duration(milliseconds: 200),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    widget.imagePaths[index].path,
                    height: imageHeight,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
