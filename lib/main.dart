import 'package:provider/provider.dart';

import 'core/common/app/providers/weather_provider.dart';
import 'core/services/injection_container.dart';
import 'package:flutter/material.dart';

import 'core/res/colours.dart';
import 'core/res/fonts.dart';
import 'core/services/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WeatherProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather App',
        theme: ThemeData(
          useMaterial3: true,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: Fonts.inter,
          appBarTheme: const AppBarTheme(
            color: Colors.transparent,
          ),
          colorScheme: ColorScheme.fromSwatch(
            accentColor: Colours.primaryColour,
            errorColor: Colours.errorColour,
          ),
        ),
        onGenerateRoute: (settings) => generateRoute(settings),
      ),
    );
  }
}
