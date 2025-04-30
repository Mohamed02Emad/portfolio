import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/features/landing/presentation/widgets/landing/navigation_sections/about_section.dart';
import 'package:portfolio/features/landing/presentation/widgets/landing/navigation_sections/contact_section.dart';
import 'package:portfolio/features/landing/presentation/widgets/landing/navigation_sections/portfolio_section.dart';

import '../../../data/models/navigation_item.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationInitial()) {
    currentPage = ValueNotifier(navigationItems.first);
  }
  final navigationItems = [
    NavigationItem('About', AboutSection()),
    NavigationItem('Portfolio', PortfolioSection()),
    // NavigationItem('Resume', ResumeSection()),
    NavigationItem('Contact', ContactSection()),
  ];
  late final ValueNotifier<NavigationItem> currentPage;
}
