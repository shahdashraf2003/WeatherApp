import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/Models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '85d01d94a2ce44059f5205721241506';
  WeatherService(this.dio);
  Future<WeatherModel> getCurrentWeather({required  String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String messageError = e.response?.data['error']['message'] ??
          '..Oops something went wrong,Try later';
      throw Exception(messageError);
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }
}
