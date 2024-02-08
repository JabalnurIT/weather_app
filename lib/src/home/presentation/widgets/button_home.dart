import 'package:flutter/material.dart';
import 'package:weather_app/core/res/fonts.dart';

import '../../../../core/common/widgets/main_text.dart';
import '../../../../core/res/colours.dart';

class ButtonHome extends StatelessWidget {
  const ButtonHome({
    super.key,
    this.height,
    this.width,
    required this.title,
    this.fontSize,
    required this.selected,
    required this.onTap,
  });

  final double? height;
  final double? width;
  final String title;
  final double? fontSize;
  final bool selected;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: width ?? 180,
        child: Column(
          children: [
            MainText(
              title,
              fontSize: fontSize ?? 18,
              fontWeight: FontWeight.bold,
              fontFamily: Fonts.inter,
              color: Colours.whiteColour.withOpacity(0.5),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 1,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.transparent,
                    if (selected) Colours.whiteColour,
                    if (selected) Colours.whiteColour,
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
