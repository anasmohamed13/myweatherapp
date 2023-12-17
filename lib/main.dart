import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                primarySwatch: getThemeColor(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.weatherCondition),
              ),
              debugShowCheckedModeBanner: false,
              home: const HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }

  switch (condition) {
    case 'sunny':
    case 'clear':
      return Colors.orange;
    case 'partly cloudy':
    case 'cloudy':
    case 'overcast':
      return Colors.grey;
    case 'mist':
    case 'fog':
      return Colors.blueGrey;
    case 'patchy rain possible':
    case 'light drizzle':
    case 'patchy light drizzle':
    case 'patchy light rain':
    case 'light rain':
    case 'moderate rain at times':
    case 'moderate rain':
    case 'heavy rain at times':
    case 'heavy rain':
      return Colors.blue;
    case 'patchy snow possible':
    case 'light snow':
    case 'patchy light snow':
    case 'patchy moderate snow':
    case 'moderate snow':
    case 'patchy heavy snow':
    case 'heavy snow':
      return Colors.blue;
    case 'patchy sleet possible':
    case 'light sleet':
    case 'moderate or heavy sleet':
      return Colors.cyan;
    case 'patchy freezing drizzle possible':
    case 'light freezing drizzle':
    case 'moderate or heavy freezing rain':
      return Colors.cyan;
    case 'thundery outbreaks possible':
    case 'patchy light rain with thunder':
    case 'moderate or heavy rain with thunder':
      return Colors.amber;
    case 'blowing snow':
    case 'blizzard':
      return Colors.grey;
    case 'freezing fog':
    case 'freezing drizzle':
    case 'heavy freezing drizzle':
    case 'light freezing rain':
    case 'light sleet showers':
    case 'moderate or heavy sleet showers':
    case 'light showers of ice pellets':
    case 'moderate or heavy showers of ice pellets':
    case 'patchy light snow with thunder':
    case 'moderate or heavy snow with thunder':
    case 'ice pellets':
    case 'light rain shower':
    case 'moderate or heavy rain shower':
    case 'torrential rain shower':
    case 'light snow showers':
    case 'moderate or heavy snow showers':
      return Colors.green;
    default:
      return Colors.grey;
  }
}
