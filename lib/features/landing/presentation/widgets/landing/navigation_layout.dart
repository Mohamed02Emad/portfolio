import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/common/dart/extension/context_extension.dart';
import 'package:portfolio/common/dart/extension/data_types/int.dart';
import 'package:portfolio/common/dart/extension/text_styles_extention.dart';
import 'package:portfolio/common/dart/extension/widget.dart';
import 'package:portfolio/common/widget/floating_mouse_effect.dart';
import 'package:portfolio/features/landing/presentation/cubits/navigation/navigation_cubit.dart';

import '../../../../../common/theme/color/app_colors.dart';

class NavigationLayout extends StatelessWidget {
  const NavigationLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<NavigationCubit>();
    return Stack(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: 15.borderRadius,
          ),
          margin: EdgeInsetsDirectional.only(top: 20, bottom: 20, end: 12),
          child: ValueListenableBuilder(
            valueListenable: cubit.currentPage,
            builder: (context, page, child) {
              return page.page;
            },
          ),
        ),
        PositionedDirectional(
          top: 4,
          end: 10,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: 12.borderRadius,
            ),
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: 12,
            ),
            child: ValueListenableBuilder(
              valueListenable: cubit.currentPage,
              builder: (context, currentPage, child) {
                final navigationItems = cubit.navigationItems;
                return Row(
                  children: List.generate(navigationItems.length, (index) {
                    final item = navigationItems[index];
                    final isSelected = currentPage.titleKey == item.titleKey;
                    return FloatingMouseEffect(
                      builder: (isHovered) {
                        return AnimatedScale(
                          scale: isHovered ? 1.16 : 1.0,
                          duration: Duration(milliseconds: 200),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              item.titleKey.tr(),
                              style: context.textStyle
                                  ?.setColor(
                                    isSelected
                                        ? AppColors.onPrimary
                                        : AppColors.text,
                                  )
                                  .copyWith(fontSize: isSelected ? 16 : 12),
                            ).marginVertical(8).clickable(() {
                              cubit.currentPage.value = item;
                            }, radius: 4),
                          ),
                        );
                      },
                    );
                  }),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
