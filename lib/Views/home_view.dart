import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_try_flutter_app/Bloces/WeatherCubit/weather_cubit.dart';
import 'package:weather_try_flutter_app/Views/search_view.dart';
import 'package:weather_try_flutter_app/Widgets/no_weather_body.dart';
import 'package:weather_try_flutter_app/Widgets/weather_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather App",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SearchView();
                }));
              },
              icon: const Icon(
                Icons.search,
              ))
        ],
      ),
      // backgroundColor: Colors.white,
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitial) {
            return const NoWeatherBody();
          } else if (state is WeatherLoaded) {
            return WeatherBody(
              weather: state.weatherModel,
            );
          } else {
            return const Center(
              child: Text("Oops, there was an error"),
            );
          }
        },
      ),
    );
  }
}
