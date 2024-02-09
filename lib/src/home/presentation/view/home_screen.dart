import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/meteocons_icons.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/core/utils/core_utils.dart';
import '../../../../core/common/app/providers/weather_provider.dart';
import '../../../../core/common/widgets/main_floating_action_button.dart';
import '../../../../core/common/widgets/main_navbar.dart';
import '../../../../core/common/widgets/main_screen_container.dart';
import '../../../../core/common/widgets/main_text.dart';
import '../../../../core/res/colours.dart';
import '../../../../core/res/media_res.dart';
import '../bloc/home_bloc.dart';
import '../widgets/button_home.dart';
import 'home_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<HomeBloc>().add(const GetCurrentWeatherEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (_, weatherProvider, __) {
        return BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is HomeError) {
              CoreUtils.showSnackBar(context, state.message);
            } else if (state is CurrentWeatherUpdated) {
              weatherProvider.initCurrentWeather(state.weather);
              if (weatherProvider.selectedForecast == 'Hourly') {
                context.read<HomeBloc>().add(const GetHourlyForecastEvent());
              } else {
                context.read<HomeBloc>().add(const GetDailyForecastEvent());
              }
            } else if (state is DailyForecastUpdated) {
              weatherProvider.initDailyForecast(state.forecast);
              weatherProvider.initSelectedForecast('Daily');
            } else if (state is HourlyForecastUpdated) {
              weatherProvider.initHourlyForecast(state.forecast);
              weatherProvider.initSelectedForecast('Hourly');
            } else if (state is TemperatureUnitChanged) {
              if (state.temperatureUnit == 'c') {
                weatherProvider.initSelectedTemperatureIndex(0);
              } else {
                weatherProvider.initSelectedTemperatureIndex(1);
              }
            }
          },
          builder: (context, state) {
            return MainScreenContainer(
              floatingActionButton: MainFloatingActionButton(
                onPressed: () {
                  context.read<HomeBloc>().add(const GetCurrentWeatherEvent());
                },
                icon: state is HomeLoading
                    ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Colours.primaryColour),
                      )
                    : const Icon(
                        Icons.refresh_rounded,
                        size: 50,
                        color: Colours.primaryColour,
                      ),
              ),
              bottomNavigationBar: MainNavbar(
                activeIndex: weatherProvider.selectedTemperatureIndex,
                icons: const [
                  Meteocons.celcius,
                  Meteocons.fahrenheit,
                ],
                onTap: (index) {
                  if (index == 0) {
                    context
                        .read<HomeBloc>()
                        .add(const ChangeTemperatureUnitEvent('c'));
                  } else {
                    context
                        .read<HomeBloc>()
                        .add(const ChangeTemperatureUnitEvent('f'));
                  }
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
                        ButtonHome(
                          title: 'Hourly Forecast',
                          selected:
                              weatherProvider.selectedForecast == 'Hourly',
                          onTap: () {
                            context
                                .read<HomeBloc>()
                                .add(const GetHourlyForecastEvent());
                          },
                        ),
                        ButtonHome(
                          title: 'Dayly Forecast',
                          selected: weatherProvider.selectedForecast == 'Daily',
                          onTap: () {
                            context
                                .read<HomeBloc>()
                                .add(const GetDailyForecastEvent());
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
                    child: (weatherProvider.selectedForecast == 'Hourly')
                        ? ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: weatherProvider.hourlyForecast.length,
                            itemBuilder: (context, index) {
                              return HomeItem(
                                selected: weatherProvider
                                    .hourlyForecast[index].selectedWeather,
                                title: weatherProvider
                                        .hourlyForecast[index].selectedWeather
                                    ? 'Now'
                                    : CoreUtils.formattedTime(weatherProvider
                                        .hourlyForecast[index].date),
                                temperature: (weatherProvider
                                            .selectedTemperatureIndex ==
                                        0)
                                    ? '${weatherProvider.hourlyForecast[index].temperatureCelsius}'
                                    : '${weatherProvider.hourlyForecast[index].temperatureFahrenheit}',
                                icon:
                                    'https:${weatherProvider.hourlyForecast[index].weatherIcon}',
                              );
                            },
                          )
                        : ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: weatherProvider.dailyForecast.length,
                            itemBuilder: (context, index) {
                              return HomeItem(
                                selected: weatherProvider
                                    .dailyForecast[index].selectedWeather,
                                title: weatherProvider
                                        .dailyForecast[index].selectedWeather
                                    ? 'Today'
                                    : CoreUtils.formattedDay(weatherProvider
                                        .dailyForecast[index].date),
                                temperature: (weatherProvider
                                            .selectedTemperatureIndex ==
                                        0)
                                    ? '${weatherProvider.dailyForecast[index].temperatureCelsius}'
                                    : '${weatherProvider.dailyForecast[index].temperatureFahrenheit}',
                                icon:
                                    'https:${weatherProvider.dailyForecast[index].weatherIcon}',
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
                  MainText(
                    weatherProvider.currentWeather.locationName,
                    fontSize: 32,
                    fontWeight: FontWeight.normal,
                    color: Colours.whiteColour,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MainText(
                    '${weatherProvider.currentWeather.temperatureCelsius}\u00B0',
                    fontSize: 98,
                    fontWeight: FontWeight.w300,
                    color: Colours.whiteColour,
                  ),
                  MainText(
                    weatherProvider.currentWeather.weatherDescription,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colours.whiteColour.withOpacity(0.7),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MainText(
                        'H: ${weatherProvider.currentWeather.latitude}\u00B0',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colours.whiteColour,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      MainText(
                        'L: ${weatherProvider.currentWeather.longitude}\u00B0',
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
      },
    );
  }
}
