import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AutoSlidingImages extends StatefulWidget {
  final List<String> imagePaths;
  final AxisDirection direction;
  final double imageHeight;
  final double viewportFraction;
  final double spacing;
  final Duration autoPlayInterval;
  final Duration animationDuration;
  final bool isRtl;

  const AutoSlidingImages({
    super.key,
    required this.imagePaths,
    this.direction = AxisDirection.left,
    this.imageHeight = 340,
    this.viewportFraction = 0.11,
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

    return Directionality(
      textDirection: widget.isRtl ? TextDirection.rtl : TextDirection.ltr,
      child: MouseRegion(
        // onEnter: (_) => setState(() => _isHovering = true),
        onExit: (_) => setState(() {
          // _isHovering = false;
          _hoveredIndex = null;
        }),
        child: CarouselSlider.builder(
          carouselController: _carouselController,
          options: CarouselOptions(
            height: widget.imageHeight,
            viewportFraction: widget.viewportFraction,
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
            // pauseAutoPlayOnHover: true,
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
                      widget.imagePaths[index],
                      height: widget.imageHeight,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
