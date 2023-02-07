import 'package:get/get.dart';
import 'package:weather_app/model/currentWeatherData.dart';
import 'package:weather_app/model/fiveDaysData.dart';
import 'package:weather_app/service/weatherService.dart';

class HomeController extends GetxController {
  String? city;
  CurrentWeatherData? currentWeatherData;
  List<FiveDaysData>? fiveDaysData = [];
  List<CurrentWeatherData>? dataList = [];

  HomeController({this.city});

  @override
  void onInit() {
    initState();
    getTopFiveCites();
    super.onInit();
  }

  void updateWeather() {
    initState();
  }

  void initState() {
    getCurrentWeatherData();
    getFiveDaysData();
  }

  void getTopFiveCites() {}

  void getCurrentWeatherData() {
    WeatherService(city: city).getCurrentWeatherData(onSuccess: (data) {
      currentWeatherData = data;
      update();
    }, onError: (error) {
      print(error);
      update();
    });
  }

  void getFiveDaysData() {
    List<String> cites = [
      'cairo',
      'zagaxig',
      'alexandria',
      'ismailia',
      'fayoum',
    ];
    cites.forEach((element) {
      WeatherService(city: city).getCurrentWeatherData(
          onSuccess: (data) {
            dataList!.add(data);
            update();
          }, onError: (error) {
        print(error);
        update();
      });
    });
  }
}
