import 'package:weather_app/Models/weather_model.dart';

abstract class WeatherState{}
class InitialWeatherState extends WeatherState{}
class WeatherLoadingState extends WeatherState{}
class WeatherSuccessState extends WeatherState{
  final WeatherModel weatherModel;
  WeatherSuccessState({required this.weatherModel});
}
class WeatherFailureState extends WeatherState{
  final String errorMessage;
  WeatherFailureState({required this.errorMessage});
}