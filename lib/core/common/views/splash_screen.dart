import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/common/widgets/gradient_background.dart';
import 'package:weather_app/core/res/fonts.dart';

import '../../res/colours.dart';
import '../../res/media_res.dart';
import '../widgets/main_text.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    super.key,
    required this.nextScreen,
  });

  final Widget nextScreen;

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen.withScreenFunction(
      duration: 3000,
      splash: const SizedBox(
        height: double.infinity,
        child: GradientBackground(
          image: MediaRes.background,
          child: Center(
            child: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 100,
                ),
                Expanded(
                  flex: 5,
                  child: MainText(
                    'Flutter Weather App',
                    fontSize: 24,
                    textAlign: TextAlign.center,
                    color: Colours.whiteColour,
                    fontWeight: FontWeight.bold,
                    fontFamily: Fonts.inter,
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Colours.whiteColour),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  flex: 1,
                  child: MainText(
                    'Powered by Jabalnur',
                    fontSize: 16,
                    textAlign: TextAlign.center,
                    color: Colours.whiteColour,
                    fontWeight: FontWeight.w300,
                    fontFamily: Fonts.inter,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      splashIconSize: double.infinity,
      screenFunction: () async {
        return nextScreen;
      },
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
