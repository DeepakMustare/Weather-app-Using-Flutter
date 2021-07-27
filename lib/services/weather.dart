import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apikey = 'd96f760f30dff89e9b2645aab35f6d4d';
const weatherApiUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityname) async {
    NetworkHelper networkHelper =
        NetworkHelper('$weatherApiUrl?q=$cityname&appid=$apikey&units=metric');
    var weathercityData = await networkHelper.getData();
    return weathercityData;
  }

  Future<dynamic> getWeatherLocation() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$weatherApiUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 30) {
      return 'It\'s 🍦 time';
    } else if (temp > 25) {
      return 'Time for shorts and 👕';
    } else if (temp > 15) {
      return 'You\'ll need 🧣 and 👕';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
