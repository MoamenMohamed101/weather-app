import 'package:weather_app/api/apiRepository.dart';
import 'package:weather_app/model/currentWeatherData.dart';
import 'package:weather_app/model/fiveDaysData.dart';
// num3
class WeatherService {
  String? city;
  String baseUrl = 'https://api.openweathermap.org/data/2.5';
  String apiKey = '74e9e9eb7a0cb36f705afc1ce8a7cf79';

  WeatherService({this.city});

  getCurrentWeatherData({
    Function()? beforeSend,
    Function(CurrentWeatherData currentWeatherData)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    final url = '$baseUrl/weather?=$city&appid=$apiKey';
    ApiRepo(url: url, payload: null).getData(
      beforeSend: () => beforeSend!(),
      onSuccess: (Map<String, dynamic> data) => onSuccess!(
        CurrentWeatherData.fromJson(data),
      ),
      onError: (error) => onError!(error),
    );
  }

  getFiveDaysThreeHoursForecastData({
    Function()? beforeSend,
    Function(List<FiveDaysData> fiveDaydata)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    final url = '$baseUrl/forecast?=$city&appid=$apiKey';
    ApiRepo(url: url, payload: null).getData(
      beforeSend: () => beforeSend!(),
      onSuccess: (Map<String, dynamic> data) {
        onSuccess!(
          (data['list'] as List).map((t) => FiveDaysData.fromJson(t)).toList()
        );
      },
      onError: (error) => onError!(error),
    );
  }
}

