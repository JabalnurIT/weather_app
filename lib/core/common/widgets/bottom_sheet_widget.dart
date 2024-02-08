import 'package:flutter/material.dart';
import '../../res/colours.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({
    super.key,
    required this.child,
    this.buttons,
    this.buttonsBottomPosition,
    this.height = 0.8,
  });

  final Widget child;
  final List<Widget>? buttons;
  final double? buttonsBottomPosition;
  final double height;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: height,
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colours.whiteColour,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        height: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: 20,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 64,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colours.accentColour,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 40,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.center,
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
