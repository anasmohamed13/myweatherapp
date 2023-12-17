import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/search_viwe.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const SearchViwe();
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.search,
            ),
          )
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
        builder: (context, State) {
          if (State is WeatherInitilState) {
            return const NoWeatherBody();
          } else if (State is WeatherLoadedState) {
            return WeatherInfoBody(
              weather: State.weatherModel,
            );
          } else {
            return const Text('oops there was an error');
          }
        },
      ),
    );
  }
}

//step for create cubit
// 1- create states
// 2- create cubit
// 3- create function
// 4- provide cubit
// 5- integrate cubit
// 6- trigger cubit
