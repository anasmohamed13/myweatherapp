import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_models.dart';

class WeatherServic {
  final Dio dio;
  //عملنا ال baseUrl متغير عشان لو اتغير بعد كده منعملش كل حاجة بايدينا
  // ف عملناه كمتغير عشان نغير في مكان واحد فهيسمع في كل حته بدل ما تكرر العملية
  // ال baseUrl  هو الجزء الثابت في ال url الي بيتتكرر في كل الmethod
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apikey = '17360add13874466ba4113956232511';

  WeatherServic(this.dio);
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apikey&q=$cityName&days=1');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errmessage = e.response?.data['error']['message'] ??
          'oops there was an error,try later!';
      throw Exception(errmessage);
    } catch (e) {
      log(e.toString());
      throw Exception('oops there was an error,try later');
    }
  }
}
