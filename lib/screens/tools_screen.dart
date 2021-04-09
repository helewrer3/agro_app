import 'package:flutter/material.dart';

class ToolsScreen extends StatelessWidget {
  static const routeName = '/tools';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as Map<String, String>;
    return Container(
      child: Text('Tools Page'),
    );
  }
}

