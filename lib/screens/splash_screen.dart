import 'package:agro_app/meta/constants.dart';
import 'package:agro_app/screens/base_screen.dart';
import 'package:agro_app/services/auth_service.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const routeName = SPLASH_ROUTE;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late bool _isLoading;
  late bool _isRefreshTokenNotNUll;

  @override
  void initState() {
    _isLoading = true;
    Future.delayed(const Duration(seconds: 2)).then((value) async {
      await AuthService.instance.readSecureStorage();
      _isRefreshTokenNotNUll = await AuthService.instance.isRefreshKeyNotNull();
    }).then((value) {
      if (_isRefreshTokenNotNUll) {
        Navigator.of(context).pushReplacementNamed(BaseScreen.routeName);
      } else {
        Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
      }
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(
              image: AssetImage(LOGO_URL),
              height: 200,
              width: 200,
            ),
            CircularProgressIndicator()
          ],
        ),
      );
    } else {
      return Container(child: null);
    }
  }
}
