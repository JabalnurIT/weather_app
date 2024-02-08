import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/meteocons_icons.dart';
import 'package:weather_app/core/common/widgets/main_floating_action_button.dart';
import 'package:weather_app/core/res/media_res.dart';
import 'package:weather_app/src/weather/presentation/view/weather_item.dart';
import 'package:weather_app/src/weather/presentation/widgets/button_weather.dart';
import '../../../../core/common/widgets/main_navbar.dart';
import '../../../../core/common/widgets/main_screen_container.dart';
import '../../../../core/common/widgets/main_text.dart';
import '../../../../core/res/colours.dart';
import '../bloc/weather_bloc.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  static const routeName = '/';

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherBloc, WeatherState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return MainScreenContainer(
          floatingActionButton: MainFloatingActionButton(
            onPressed: () {},
            icon: const Icon(
              Icons.refresh_rounded,
              size: 50,
              color: Colours.primaryColour,
            ),
          ),
          bottomNavigationBar: MainNavbar(
            icons: const [
              Meteocons.celcius,
              Meteocons.fahrenheit,
            ],
            onTap: (index) {
              print(index);
            },
          ),
          heightSheet: MediaQuery.of(context).size.height * .42,
          bottomSheet: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colours.accentColour.withOpacity(0.5),
                      width: 1,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ButtonWeather(
                      title: 'Hourly Forecast',
                      selected: false,
                      onTap: () {
                        print('Hourly Forecast');
                      },
                    ),
                    ButtonWeather(
                      title: 'Weekly Forecast',
                      selected: true,
                      onTap: () {
                        print('Weekly Forecast');
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 140,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return WeatherItem(
                      selected: index == 1,
                      title: index == 1 ? 'Now' : 'Monday',
                      temperature: '19',
                    );
                  },
                ),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              const MainText(
                'Surabaya',
                fontSize: 32,
                fontWeight: FontWeight.normal,
                color: Colours.whiteColour,
              ),
              const SizedBox(
                height: 10,
              ),
              const MainText(
                '19\u00B0',
                fontSize: 98,
                fontWeight: FontWeight.w300,
                color: Colours.whiteColour,
              ),
              MainText(
                'Mostly Clear',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colours.whiteColour.withOpacity(0.7),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MainText(
                    'H: 24\u00B0',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colours.whiteColour,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  MainText(
                    'L: 16\u00B0',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colours.whiteColour,
                  ),
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  MediaRes.houseImage,
                  width: MediaQuery.of(context).size.width * .9,
                  // height: 350,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}