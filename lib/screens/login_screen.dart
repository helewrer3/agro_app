import 'dart:convert';
import 'package:vihaan_app/screens/base_screen.dart';

import '../meta/global_vars.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:vihaan_app/screens/tools_screen.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final FlutterAppAuth appAuth = FlutterAppAuth();
const FlutterSecureStorage secureStorage = FlutterSecureStorage();

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false, _isFailed = false;
  String _error;

  Future<Map<String, Object>> getUserDetails(String accessToken) async {
    const String url = '$AUTH0_ISSUER/userinfo';
    final http.Response response = await http.get(url,
      headers: <String, String>{'Authorization': 'Bearer $accessToken'},
    );

    if (response.statusCode == 200) return jsonDecode(response.body);
    else throw Exception('Failed to get user details');
  }

  Future<void> loginAction() async {
    try {
      setState(() {
        _isLoading = true;
        _isFailed = false; 
        _error = '';     
      });
      final AuthorizationTokenResponse result = await appAuth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          AUTH0_CLIENT_ID,
          AUTH0_REDIRECT_URI,
          issuer: 'https://$AUTH0_DOMAIN',
          scopes: <String>['openid', 'profile', 'offline_access'],
          promptValues: ['login']
        ),
      );
      final Map<String, Object> profile = await getUserDetails(result.accessToken);
      await secureStorage.write(key: 'refresh_token', value: result.refreshToken);
      await secureStorage.write(key: 'name', value: profile['nickname']);
      await secureStorage.write(key: 'picture', value: profile['picture']);
      global_name = profile['nickname'];
      global_imageUrl = profile['picture'];
      setState(() {
        _isLoading = _isFailed = false;
        _error = '';
      });
      Navigator.of(context).pushReplacementNamed(BaseScreen.routeName);
    } catch (e) {
      print(e);
      setState(() {
        _isLoading = false;
        _isFailed = true; 
        _error = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if(_isLoading) return Center(child: CircularProgressIndicator());
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          onPressed: () async {
            await loginAction();
          },
          child: const Text('Login'),
        ),
        (_isFailed)? Text(_error): Text(''),
      ],
    );
  }
}