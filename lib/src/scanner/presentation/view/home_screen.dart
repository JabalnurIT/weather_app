import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/common/widgets/gradient_background.dart';
import '../../../../core/common/widgets/main_screen_container.dart';
import '../../../../core/common/widgets/main_text.dart';
import '../../../../core/res/colours.dart';
import '../../../../core/res/media_res.dart';
import '../bloc/scanner_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScannerBloc, ScannerState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colours.neutralColour,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colours.accentColour,
            onPressed: () {},
            child: const Icon(Icons.camera, color: Colours.whiteColour),
          ),
          body: GradientBackground(
            image: MediaRes.background,
            child: MainScreenContainer(
              content: const Column(
                children: [
                  SizedBox(
                    child: Column(
                      children: [
                        MainText(
                          'Hasil Klasifikasi',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colours.whiteColour,
                        ),
                        MainText(
                          'Gula-gula',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colours.accentLighterColour,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    child: Column(
                      children: [
                        MainText(
                          'Tingkat Klasifikasi',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colours.whiteColour,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MainText(
                              'Gula-gula:',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colours.whiteColour,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            MainText(
                              '0.9%',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colours.accentLighterColour,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MainText(
                              'Merah:',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colours.whiteColour,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            MainText(
                              '17.1%',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colours.accentLighterColour,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MainText(
                              'Putih:',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colours.whiteColour,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            MainText(
                              '82.0%',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colours.accentLighterColour,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MainText(
                              'Bencong:',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colours.whiteColour,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            MainText(
                              '12.0%',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colours.accentLighterColour,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              header: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const MainText(
                      'Pamelo Fruit Scanner',
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colours.whiteColour,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        'https://picsum.photos/250/350',
                        width: 250,
                        height: 350,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              // Edit Until Here
            ),
          ),
        );
      },
    );
  }
}
