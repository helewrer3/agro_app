import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:vihaan_app/meta/global_vars.dart';
import 'package:vihaan_app/widgets/weather_details.dart';
import 'package:weather/weather.dart';

WeatherFactory wf = new WeatherFactory(WEATHER_KEY);

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) return Future.error('Location services are disabled.');
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.deniedForever) return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    if (permission == LocationPermission.denied) return Future.error('Location permissions are denied');
  }
  return await Geolocator.getCurrentPosition();
}

class WeatherScreen extends StatefulWidget {
  static const routeName = '/weather';
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  bool _isLoading = true;
  Weather _weather;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((_) async {
      var position = await _determinePosition();
      _weather = await wf.currentWeatherByLocation(position.latitude, position.longitude);
      setState(() {
        _isLoading = false;    
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather'),),
      body: _isLoading? Center(child: CircularProgressIndicator()) : WeatherDetails(weather: _weather),
    );
  }
}