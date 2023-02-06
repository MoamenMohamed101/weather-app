class MainWeather {
  double? temp, feels_like, temp_min, temp_max;

  int? pressure, humidity;

  MainWeather(
      {this.temp,
      this.feels_like,
      this.temp_min,
      this.temp_max,
      this.pressure,
      this.humidity});

  Map<String, dynamic> toJson() {
    return {
      "temp": this.temp,
      "feels_like": this.feels_like,
      "temp_min": this.temp_min,
      "temp_max": this.temp_max,
      "pressure": this.pressure,
      "humidity": this.humidity,
    };
  }

  factory MainWeather.fromJson(Map<String, dynamic> json) {
    return MainWeather(
      temp: double.parse(json["temp"]),
      feels_like: double.parse(json["feels_like"]),
      temp_min: double.parse(json["temp_min"]),
      temp_max: double.parse(json["temp_max"]),
      pressure: int.parse(json["pressure"]),
      humidity: int.parse(json["humidity"]),
    );
  }
}
