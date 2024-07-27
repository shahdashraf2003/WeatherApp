import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_wearher_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widget/no_weather_body.dart';
import 'package:weather_app/widget/weather_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 113, 92, 120),
          title: const Text(
            'Weather App',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
                color: Colors.white),
          ),
          actions: [
            IconButton(
              color: Colors.white,
              icon: const Icon(Icons.search),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SearchView(),
                  ),
                );
              },
            ),
          ],
        ),
        body: BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {
          if (state is InitialWeatherState) {
            return const NoWeatherBodyView();
          } else if (state is WeatherLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          else if (state is WeatherSuccessState) {
            return WeatherBodyView(
              weather: state.weatherModel,
            );
          } else {
            return Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/s.jpg"),
                    fit: BoxFit.contain,
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(top: 350),
                  child: Center(
                      child: Text(
                    'Something went wrong..Try later',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    ),
                  )),
                ));
          }
        }));
  }
}
