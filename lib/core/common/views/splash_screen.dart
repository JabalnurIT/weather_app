import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

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
      splash: SizedBox(
        height: 400,
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                height: 60,
              ),
              const MainText(
                'Klasifikasi Varietas Jeruk Pamelo Pangkep Menggunakan'
                ' Metode Convolutional Neural Network',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colours.blackColour,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 100,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  MediaRes.logoUnhas,
                  height: 200,
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              const MainText(
                'Muh. Ishak Ramadhan',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colours.blackColour,
                textAlign: TextAlign.center,
              ),
              const MainText(
                '5025201241',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colours.blackColour,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 60,
              ),
              const MainText(
                '2024',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colours.blackColour,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
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
