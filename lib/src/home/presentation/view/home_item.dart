import 'package:flutter/material.dart';

import '../../../../core/common/widgets/main_text.dart';
import '../../../../core/res/colours.dart';

class HomeItem extends StatelessWidget {
  const HomeItem({
    super.key,
    required this.title,
    required this.temperature,
    required this.selected,
    required this.icon,
  });

  final String title;
  final String temperature;
  final bool selected;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      width: 80,
      decoration: BoxDecoration(
        color: selected
            ? Colours.primaryColour
            : Colours.primaryColour.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colours.whiteColour.withOpacity(0.5),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colours.accentColour.withOpacity(0.6),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(3, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MainText(
            title,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colours.whiteColour,
          ),
          const SizedBox(
            height: 8,
          ),
          Image.network(
            icon,
            width: 40,
            height: 40,
          ),
          const SizedBox(
            height: 10,
          ),
          MainText(
            '$temperature\u00B0',
            fontSize: 24,
            fontWeight: FontWeight.w300,
            color: Colours.whiteColour,
          ),
        ],
      ),
    );
  }
}
