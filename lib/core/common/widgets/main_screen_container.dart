import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:weather_app/core/res/colours.dart';

import '../../res/media_res.dart';
import 'gradient_background.dart';

class MainScreenContainer extends StatelessWidget {
  const MainScreenContainer({
    super.key,
    required this.child,
    this.bottomSheet,
    this.padding,
    this.heightSheet,
    this.bottomNavigationBar,
    this.floatingActionButton,
  });

  final Widget child;
  final Widget? bottomSheet;
  final EdgeInsets? padding;
  final double? heightSheet;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.neutralColour,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: bottomNavigationBar,
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: GradientBackground(
        image: MediaRes.background,
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              SafeArea(
                child: Padding(
                  padding: padding ??
                      const EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    child: child,
                  ),
                ),
              ),
              bottomSheet != null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GlassmorphicContainer(
                          borderGradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colours.primaryColour.withOpacity(0.5),
                              Colours.secondaryColour.withOpacity(0.5),
                            ],
                          ),
                          width: double.infinity,
                          height: heightSheet ??
                              MediaQuery.of(context).size.height * .5,
                          borderRadius: 50,
                          blur: 20,
                          alignment: Alignment.center,
                          border: 2,
                          linearGradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colours.primaryColour.withOpacity(0.5),
                              Colours.secondaryColour.withOpacity(0.5),
                            ],
                          ),
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                height: 5,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colours.blackColour.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              bottomSheet!,
                            ],
                          ),
                        ),
                      ],
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
