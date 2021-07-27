import 'package:flutter/material.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    getlocationData();

    super.initState();
  }

  void getlocationData() async {
    WeatherModel weather = WeatherModel();

    var weatherData = await weather.getWeatherLocation();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(weatherLocation: weatherData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SpinKitCircle(
        color: Colors.green,
        size: 100.0,
      ),
    ));
  }
}
