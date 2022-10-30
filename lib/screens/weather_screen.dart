import 'package:agro_app/meta/constants.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';

WeatherFactory wf = WeatherFactory(WEATHER_SECRET);

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  static const routeName = WEATHER_ROUTE;

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late bool _isLoading;
  late Weather _weather;

  @override
  void initState() {
    setState(() {
      _isLoading = true;
    });
    _getWeather();
    super.initState();
  }

  Future<void> _getWeather() async {
    var position = await _determinePosition();
    _weather = await wf.currentWeatherByLocation(
        position.latitude, position.longitude);
    setState(() {
      _isLoading = false;
    });
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error(LOCATION_SERVICES_DISABLED);
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return Future.error(LOCATION_PERMISSION_DEINED_FOREVER);
      }
      if (permission == LocationPermission.denied) {
        return Future.error(LOCATION_PERMISSION_DENIED);
      }
    }
    return await Geolocator.getCurrentPosition();
  }

  Widget _makeWeatherPage() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${_weather.areaName}',
            style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            '${_weather.temperature?.celsius?.toStringAsFixed(2)} °C',
            style: const TextStyle(fontSize: 30),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.network(
                '$WEATHER_PROVIDER/img/w/${_weather.weatherIcon}.png',
              ),
              Text(
                '${_weather.weatherMain}',
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  const Icon(Icons.calendar_today),
                  const SizedBox(width: 10),
                  Text(
                    DateFormat.yMMMd().format(_weather.date!),
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.timer),
                  const SizedBox(width: 10),
                  Text(
                    DateFormat.Hm().format(_weather.date!),
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(WEATHER),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _makeWeatherPage(),
    );
  }
}
