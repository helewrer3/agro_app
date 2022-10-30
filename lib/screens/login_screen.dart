import 'package:agro_app/meta/constants.dart';
import 'package:flutter/material.dart';
import 'package:agro_app/services/auth_service.dart';

import 'base_screen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const routeName = LOGIN_ROUTE;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false, _isFailed = false;
  late String _error;

  Future<void> _loginAction() async {
    try {
      setState(() {
        _isLoading = true;
        _isFailed = false;
        _error = NONE_TEXT;
      });

      var profile = await AuthService.instance.getUserDetails();

      await AuthService.instance.writeSecureStorage(profile);

      setState(() {
        _isLoading = _isFailed = false;
        _error = NONE_TEXT;
      });
      Navigator.of(context).pushReplacementNamed(BaseScreen.routeName);
    } catch (e) {
      print(e);
      setState(() {
        _isLoading = false;
        _isFailed = true;
        _error = ERROR;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 200, child: Image.asset(LOGO_URL)),
          const Text(
            'AGRO APP',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                decoration: TextDecoration.none),
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () async {
              await _loginAction();
            },
            child: const Text(LOGIN),
          ),
          SizedBox(
              width: 200,
              height: 200,
              child: (_isFailed)
                  ? Text(
                      _error,
                      softWrap: true,
                      style: const TextStyle(
                          fontSize: 10, decoration: TextDecoration.none),
                    )
                  : const Text(NONE_TEXT)),
        ],
      );
    }
  }
}
