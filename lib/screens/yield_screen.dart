import 'package:flutter/material.dart';

class YieldScreen extends StatelessWidget {
  static const routeName = '/yield';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    return Container(
      child: Text('Yield Page'),
    );
  }
}
