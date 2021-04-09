import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:intl/intl.dart';

class WeatherDetails extends StatelessWidget {
  const WeatherDetails({
    Key key,
    @required Weather weather,
  }) : _weather = weather, super(key: key);

  final Weather _weather;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('${_weather.areaName}',
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 10,),
          Text('${_weather.temperature.celsius.toStringAsFixed(2)} °C',
            style: TextStyle(
              fontSize: 30
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.network('https://openweathermap.org/img/w/${_weather.weatherIcon}.png',),
              Text('${_weather.weatherMain}',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Icon(Icons.calendar_today),
                  SizedBox(width: 10),
                  Text(new DateFormat.yMMMd().format(_weather.date),
                    style: TextStyle(
                      fontSize: 20
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.timer),
                  SizedBox(width: 10),
                  Text(new DateFormat.Hm().format(_weather.date), 
                    style: TextStyle(
                      fontSize: 20
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}