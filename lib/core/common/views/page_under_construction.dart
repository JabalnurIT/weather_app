import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../res/colours.dart';
import '../../res/media_res.dart';
import '../widgets/gradient_background.dart';

class PageUnderConstruction extends StatelessWidget {
  const PageUnderConstruction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        image: MediaRes.background,
        child: Center(
          child: ColorFiltered(
            colorFilter: const ColorFilter.mode(
              Colours.primaryColour,
              BlendMode.srcIn,
            ),
            child: Lottie.asset(
              MediaRes.construction,
            ),
          ),
        ),
      ),
    );
  }
}
