import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Models/weather_model.dart';
import 'package:weather_app/Services/weather_service.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(InitialWeatherState());
  WeatherModel? weatherModel;
  getWeather({required String cityName}) async {
    emit(WeatherLoadingState());
    try {
      weatherModel =
          await WeatherService(Dio()).getCurrentWeather(cityName: cityName);
      emit(WeatherSuccessState(weatherModel: weatherModel!));
    } catch (e) {
      emit(WeatherFailureState(errorMessage: e.toString()));
    }
  }
}
