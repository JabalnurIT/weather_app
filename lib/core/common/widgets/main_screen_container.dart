import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:weather_app/core/res/colours.dart';

class MainScreenContainer extends StatelessWidget {
  const MainScreenContainer({
    super.key,
    required this.header,
    this.padding,
    required this.content,
  });

  final Widget header;
  final Widget content;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GlassmorphicContainer(
                width: double.infinity,
                height: 300,
                borderRadius: 50,
                blur: 20,
                alignment: Alignment.bottomCenter,
                border: 2,
                linearGradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colours.whiteColour.withOpacity(0.1),
                      Colours.whiteColour.withOpacity(0.05),
                    ],
                    stops: const [
                      0.1,
                      1,
                    ]),
                borderGradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colours.whiteColour.withOpacity(0.5),
                    Colours.whiteColour.withOpacity(0.5),
                  ],
                ),
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: content,
                ),
              ),
            ],
          ),
          SafeArea(
            child: Padding(
              padding: padding ??
                  const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: header,
            ),
          ),
        ],
      ),
    );
  }
}
