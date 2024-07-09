import 'package:weather_app/Models/weather_model.dart';

class WeatherState{}
class InitialWeatherState extends WeatherState{}
class WeatherLoadedState extends WeatherState{
  final WeatherModel weatherModel;
  WeatherLoadedState({required this.weatherModel});
}
class WeatherFailureState extends WeatherState{
  final String errorMessage;
  WeatherFailureState({required this.errorMessage});
}