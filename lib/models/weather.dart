class Weather {
  String cityName;
  int temperature;
  int humidity;
  String icon;
  String description;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.humidity,
    required this.icon,
    required this.description,
  });

  factory Weather.fromjson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      temperature: json['main']['temp'].toInt(),
      humidity: json['main']['humidity'],
      description: json['weather'][0]['description'],
      icon:
          'http://openweathermap.org/img/wn/${json['weather'][0]['icon']}.png',
    );
  }
}
