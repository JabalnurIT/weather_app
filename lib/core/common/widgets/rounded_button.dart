import 'package:flutter/material.dart';

import '../../res/colours.dart';
import 'main_text.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    super.key,
    this.backgroundColor,
    this.foregroundColor,
    required this.onPressed,
    required this.text,
    this.fontFamily,
    this.fontWeight,
    this.horizontalPadding,
    this.verticalPadding,
    this.radius,
    this.icon,
    this.iconPositionFront = true,
    this.fontSize,
    this.buttonSize,
    this.iconOnly = false,
  });

  final Color? backgroundColor;
  final Color? foregroundColor;
  final VoidCallback onPressed;
  final String text;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? radius;
  final Icon? icon;
  final bool iconPositionFront;
  final double? fontSize;
  final Size? buttonSize;
  final bool iconOnly;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: buttonSize ?? const Size(double.infinity, double.infinity),
        minimumSize: buttonSize ?? const Size(double.infinity, 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 20),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 50,
          vertical: verticalPadding ?? 17,
        ),
        backgroundColor: backgroundColor ?? Colours.accentColour,
        foregroundColor: foregroundColor ?? Colors.white,
      ),
      onPressed: () async {
        onPressed();
      },
      child: icon == null
          ? MainText(
              text,
              fontSize: fontSize,
              fontFamily: fontFamily,
              fontWeight: fontWeight ?? FontWeight.bold,
              color: foregroundColor ?? Colors.white,
            )
          : iconOnly
              ? icon
              : SizedBox(
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      (iconPositionFront) ? icon! : const SizedBox(),
                      (iconPositionFront)
                          ? const SizedBox(width: 10)
                          : const SizedBox(),
                      MainText(
                        text,
                        fontSize: fontSize,
                        fontFamily: fontFamily,
                        fontWeight: fontWeight ?? FontWeight.bold,
                        color: foregroundColor ?? Colors.white,
                      ),
                      (!iconPositionFront)
                          ? const SizedBox(width: 10)
                          : const SizedBox(),
                      (!iconPositionFront) ? icon! : const SizedBox(),
                    ],
                  ),
                ),
    );
  }
}
