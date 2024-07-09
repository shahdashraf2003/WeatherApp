import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Models/weather_model.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_wearher_cubit.dart';

class WeatherBodyView extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  WeatherBodyView({
    super.key,
    required this.weather,
  });
  final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
          colors: ([
            Color.fromARGB(255, 12, 33, 90),
            Color.fromARGB(255, 56, 60, 130),
            Color.fromARGB(255, 71, 63, 121),
            Color.fromARGB(255, 73, 65, 123),
            Color.fromARGB(255, 82, 74, 134),
            Color.fromARGB(255, 156, 126, 199),
          ]),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weatherModel.cityName,
            style: const TextStyle(
              fontSize: 28.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'updated at ${weatherModel.date.hour}:${weatherModel.date.minute}',
            style: const TextStyle(color: Colors.white, fontSize: 22.0),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image(
                image: NetworkImage('https:${weatherModel.image}'),
                width: 120,
                height: 120,
              ),
              Text(
                weatherModel.temp.round().toString(),
                style: const TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                children: [
                  Text(
                    'max temp:${weatherModel.maxTemp.round()}',
                    style: const TextStyle(
                      fontSize: 17.0,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'max temp:${weatherModel.minTemp.round()}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17.0,
                    ),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            weatherModel.weatherCondition,
            style: const TextStyle(
              fontSize: 26.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
