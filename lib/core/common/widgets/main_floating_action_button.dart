import 'package:flutter/material.dart';

import '../../res/colours.dart';

class MainFloatingActionButton extends StatelessWidget {
  const MainFloatingActionButton({
    super.key,
    this.size,
    required this.onPressed,
    required this.icon,
  });

  final Size? size;
  final Function() onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size?.height ?? 80,
      width: size?.width ?? 80,
      child: FloatingActionButton(
        backgroundColor: Colours.whiteColour,
        shape: const CircleBorder(),
        onPressed: onPressed,
        child: icon,
      ),
    );
  }
}
