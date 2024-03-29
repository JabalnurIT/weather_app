import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/res/colours.dart';

class MainNavbar extends StatelessWidget {
  const MainNavbar({
    super.key,
    required this.icons,
    required this.onTap,
    this.activeIndex = 0,
  });

  final List<IconData> icons;
  final int activeIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar(
      safeAreaValues: const SafeAreaValues(bottom: false, top: false),
      blurEffect: true,
      icons: icons,
      height: 60,
      iconSize: 60,
      activeColor: Colours.secondaryColour,
      inactiveColor: Colours.secondaryColour.withOpacity(0.4),
      splashColor: Colours.primaryColour,
      backgroundGradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Colours.accentColour.withOpacity(1),
          Colours.primaryColour.withOpacity(1),
          Colours.accentColour.withOpacity(1),
        ],
      ),
      activeIndex: activeIndex,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge,
      onTap: onTap,
    );
  }
}
