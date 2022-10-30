import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../meta/constants.dart';
import '../meta/global_vars.dart';

class AuthService {
  static final AuthService instance = AuthService._internal();

  factory AuthService() => instance;

  AuthService._internal();

  final FlutterAppAuth appAuth = const FlutterAppAuth();
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  Future<AuthorizationTokenResponse?> login() async {
    final authorizationTokenRequest = AuthorizationTokenRequest(
      AUTH0_CLIENT_ID,
      AUTH0_REDIRECT_URI,
      issuer: AUTH0_ISSUER,
      scopes: ['openid', 'profile', 'offline_access'],
      promptValues: ['login']
    );
    final AuthorizationTokenResponse? result =
        await appAuth.authorizeAndExchangeCode(
      authorizationTokenRequest,
    );
    return result;
  }

  Future<Map<String, dynamic>> getUserDetails() async {
    const String url = '$AUTH0_ISSUER/userinfo';
    var result = await login();
    if(result == null) {
      throw Exception('Failed to get user details');
    } else {
    var accessToken = result.accessToken;
      final response = await http.get(
        Uri.parse(url),
        headers: {'Authorization': 'Bearer $accessToken'},
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        data[REFRESH_TOKEN_KEY] = result.refreshToken;
        return data;
      } else {
        throw Exception('Failed to get user details');
      }
    }
  }

  Future<void> writeSecureStorage(var profile) async {
    await secureStorage.write(
        key: REFRESH_TOKEN_KEY, value: profile[REFRESH_TOKEN_KEY].toString());
    await secureStorage.write(
        key: NAME_KEY, value: profile[NAME_KEY].toString());
    await secureStorage.write(
        key: IMAGE_KEY, value: profile[IMAGE_KEY].toString());
  }

  Future<void> readSecureStorage() async {
    globalName = await secureStorage.read(key: NAME_KEY);
    globalImageUrl = await secureStorage.read(key: IMAGE_KEY);
  }

  Future<void> deleteRefreshToken() async {
    await secureStorage.delete(key: REFRESH_TOKEN_KEY);
  }

  Future<bool> isRefreshKeyNotNull() async {
    if(await secureStorage.read(key: REFRESH_TOKEN_KEY) != null) {
      return true;
    } else {
      return false;
    }
  }
}
