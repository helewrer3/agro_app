import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:vihaan_app/meta/global_vars.dart';
import 'package:vihaan_app/screens/base_screen.dart';
import 'package:vihaan_app/screens/login_screen.dart';
const FlutterSecureStorage secureStorage = FlutterSecureStorage();

class SplashScreen extends StatefulWidget {
  static const routeName = '/';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String _storedRefreshToken;
  bool _isLoading;

  @override
  void initState() {
    _isLoading = true;
    Future.delayed(Duration.zero).then((value) async {
      _storedRefreshToken = await secureStorage.read(key: 'refresh_token');
      global_name = await secureStorage.read(key: 'name');
      global_imageUrl = await secureStorage.read(key: 'picture');
      if(_storedRefreshToken != null) Navigator.of(context).pushReplacementNamed(BaseScreen.routeName);
      else Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(_isLoading) return Center(child: Container(child: CircularProgressIndicator()));
    else return Container(child: null);
  }
}