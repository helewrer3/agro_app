import 'package:flutter/material.dart';
import 'package:vihaan_app/screens/add_product_screen.dart';
import 'package:vihaan_app/screens/base_screen.dart';
import 'package:vihaan_app/screens/login_screen.dart';
import 'package:vihaan_app/screens/news_screen.dart';
import 'package:vihaan_app/screens/tools_screen.dart';
import 'package:vihaan_app/screens/splash_screen.dart';
import 'package:vihaan_app/screens/weather_screen.dart';
import 'package:vihaan_app/screens/yield_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: 'Agro App',
      routes: {
        '/': (ctx) => SplashScreen(),
        BaseScreen.routeName: (ctx) => BaseScreen(),
        LoginScreen.routeName: (ctx) => LoginScreen(),
        ToolsScreen.routeName: (ctx) => ToolsScreen(),
        NewsScreen.routeName: (ctx) => NewsScreen(),
        WeatherScreen.routeName: (ctx) => WeatherScreen(),
        YieldScreen.routeName: (ctx) => YieldScreen(),
        AddProductScreen.routeName: (ctx) => AddProductScreen()
      },
    );
  }
}
