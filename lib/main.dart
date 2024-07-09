import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_wearher_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return const MaterialApp(
              // theme: ThemeData(
              //   useMaterial3: false,
              //   primarySwatch: getColor(
              //       BlocProvider.of<GetWeatherCubit>(context)
              //           .weatherModel
              //           ?.weatherCondition),
              // ),
              debugShowCheckedModeBanner: false,
              home: HomeView(),
            );
          },
        ),
      ),
    );
  }
}

// MaterialColor getColor(String? condition) {
//   if (condition == null) {
//     return Colors.indigo;
//   } else {
//     switch (condition) {
//       case 'sunny':
//         return Colors.orange;
//       case 'cloudy':
//         return Colors.grey;
//       case 'rainy':
//         return Colors.blue;

//       case 'windy':
//         return Colors.lightBlue;
//       default:
//         return Colors.indigo;
//     }
//   }
// }
