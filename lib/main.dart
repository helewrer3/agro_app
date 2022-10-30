import 'package:agro_app/meta/constants.dart';
import 'package:agro_app/screens/add_product_screen.dart';
import 'package:agro_app/screens/base_screen.dart';
import 'package:agro_app/screens/login_screen.dart';
import 'package:agro_app/screens/news_screen.dart';
import 'package:agro_app/screens/splash_screen.dart';
import 'package:agro_app/screens/tools_screen.dart';
import 'package:agro_app/screens/weather_screen.dart';
import 'package:agro_app/screens/yield_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: AGRO_APP,
      routes: {
        SplashScreen.routeName: (ctx) => const SplashScreen(),
        BaseScreen.routeName: (ctx) => const BaseScreen(),
        LoginScreen.routeName: (ctx) => const LoginScreen(),
        NewsScreen.routeName: (ctx) => const NewsScreen(),
        WeatherScreen.routeName: (ctx) => const WeatherScreen(),
        ToolsScreen.routeName: (ctx) => const ToolsScreen(),
        YieldScreen.routeName: (ctx) => const YieldScreen(),
        AddProductScreen.routeName: (ctx) => AddProductScreen()
      },
    );
  }
}
