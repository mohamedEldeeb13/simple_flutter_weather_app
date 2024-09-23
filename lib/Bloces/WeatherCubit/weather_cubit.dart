import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:weather_try_flutter_app/Services/weather_service.dart';
import 'package:weather_try_flutter_app/models/weather_model.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());
  WeatherModel? weatherModel;
  getWeather({required String cityName}) async {
    try {
      weatherModel =
          await WeatherService(dio: Dio()).getWeather(cityName: cityName);
      emit(WeatherLoaded(weatherModel: weatherModel!));
    } catch (e) {
      emit(WeatherFailure());
    }
  }
}
