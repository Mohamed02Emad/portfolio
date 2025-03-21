import 'package:decorizer/common/dart/extension/color_extension.dart';
import 'package:decorizer/common/dart/extension/data_types/double.dart';
import 'package:decorizer/common/dart/extension/widget.dart';
import 'package:decorizer/common/widget/app/skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppImage extends StatelessWidget {
  final String? path;
  final double height;
  final double width;
  final double radius;
  final BoxFit fit;
  final Color? color, borderColor;

  const AppImage({
    super.key,
    required this.path,
    this.height = 100,
    this.color,
    this.borderColor,
    this.width = 100,
    this.radius = 0,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: radius.borderRadius,
        border: borderColor == null
            ? null
            : Border.all(
                color: borderColor!,
                width: 1,
              ),
      ),
      child: Image.asset(
        path ?? '',
        height: height,
        width: width,
        fit: fit,
        color: color,
        errorBuilder: (context, error, stackTrace) {
          return Image.network(
            path ?? '',
            height: height,
            width: width,
            fit: fit,
            color: color,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return _fadeEffect(child);
              }
              return Skeleton(
                height: height,
                width: width,
              );
            },
            errorBuilder: (context, error, stackTrace) {
              try {
                return _fadeEffect(SvgPicture.asset(
                  path ?? '',
                  height: height,
                  width: width,
                  fit: fit,
                  colorFilter: color?.colorFilter,
                ));
              } catch (e) {
                return _errorWidget();
              }
            },
          );
        },
      ).clip(radius),
    );
  }

  Widget _fadeEffect(Widget child) {
    return AnimatedOpacity(
      opacity: 1.0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
      child: child,
    );
  }

  Widget _errorWidget() {
    return Icon(
      Icons.image_not_supported,
      size: height,
      color: color,
    );
  }
}
