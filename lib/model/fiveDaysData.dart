class FiveDaysData {
  int? temp;
  String? dateTime;

  FiveDaysData({this.temp, this.dateTime});

  factory FiveDaysData.fromJson(Map<String, dynamic> json) {
    return FiveDaysData(
      temp: int.parse(json["temp"]),
      dateTime: json["dateTime"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "temp": this.temp,
      "dateTime": this.dateTime,
    };
  }
}
