import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_try_flutter_app/Bloces/WeatherCubit/weather_cubit.dart';
import 'package:weather_try_flutter_app/Views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(),
      child: Builder(
          builder: (context) => BlocBuilder<WeatherCubit, WeatherState>(
                  builder: (context, state) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                    appBarTheme: AppBarTheme(
                      backgroundColor: getMaterialColorByWeatherCondition(
                          BlocProvider.of<WeatherCubit>(context)
                              .weatherModel
                              ?.weatherCondition),
                    ),
                  ),
                  home: const HomeView(),
                );
              })),
    );
  }
}

MaterialColor getMaterialColorByWeatherCondition(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case 'Sunny':
    case 'Clear':
      return Colors.orange;
    case 'Partly cloudy':
    case 'Cloudy':
      return Colors.blueGrey;
    case 'Overcast':
      return Colors.blueGrey;
    case 'mist':
    case 'fog':
      return Colors.grey;
    case 'patchy rain possible':
    case 'light rain':
    case 'moderate rain':
    case 'heavy rain':
    case 'patchy light rain':
    case 'light rain shower':
    case 'moderate or heavy rain shower':
    case 'torrential rain shower':
      return Colors.indigo;
    case 'patchy snow possible':
    case 'light snow':
    case 'moderate snow':
    case 'heavy snow':
    case 'patchy light snow':
    case 'light snow showers':
    case 'moderate or heavy snow showers':
    case 'thunderstorm':
    case 'thundery outbreaks possible':
    case 'moderate or heavy rain with thunder':
    case 'patchy light rain with thunder':
    case 'thunderstorm':
    case 'thundery outbreaks possible':
    case 'moderate or heavy rain with thunder':
    case 'patchy light rain with thunder':
    case 'drizzle':
    case 'patchy light drizzle':
    case 'light drizzle':
    case 'freezing drizzle':
      return Colors.lightBlue;
    default:
      return Colors.blue; // Default color for unknown conditions
  }
}
