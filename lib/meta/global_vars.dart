import 'package:flutter/material.dart';
import 'package:vihaan_app/screens/weather_screen.dart';

const String AUTH0_DOMAIN = 'dev-ji6lcyp5.us.auth0.com';
const String AUTH0_CLIENT_ID = 'hRVLCCU6V7SH4SH4ZuAkRzV2NaM0jPyI';
const String AUTH0_REDIRECT_URI = 'com.auth0.flutterdemo://login-callback';
const String AUTH0_ISSUER = 'https://$AUTH0_DOMAIN';
const String WEATHER_KEY = 'ad6ba04780c2603bc57a9fd63df4c745';
String global_name = '';
String global_imageUrl = '';

var appBarTitleText = {
  0: "Tools",
  1: "Disease Prediction",
  2: "Yield Prediction",
  3: "News",
  4: "Marketplace",
};

var appBarBackgroundColor = {
  0: Colors.green,
  1: Colors.red,
  2: Colors.purple,
  3: Colors.black,
  4: Colors.deepPurple,
};

var navBarIcons = {
  0: Icons.build,
  1: Icons.coronavirus_outlined,
  2: Icons.spa,
  3: Icons.book,
  4: Icons.store,
};
var navBarTitle = {
  0: "Tools",
  1: "Disease",
  2: "Yield",
  3: "News",
  4: "Marketplace",
};

Map<int, Function> appBarActiveActionWidget = {
  0: (BuildContext ctx){return Text('');},
  1: (BuildContext ctx){return IconButton(icon: Icon(Icons.add_a_photo), onPressed: null);},
  2: (BuildContext ctx){return Text('');},
  3: (BuildContext ctx){return IconButton(icon: Icon(Icons.cloud), onPressed: (){Navigator.of(ctx).pushNamed(WeatherScreen.routeName);});},
  4: (BuildContext ctx){return IconButton(icon: Icon(Icons.add), onPressed: null);},
};

var appBarActiveActionTask = {
  0: null,
  1: null,
  2: null,
  3: null,
  4: null,
};