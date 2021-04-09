import 'package:flutter/material.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:plantdisease_app/meta/constants.dart';
import 'package:plantdisease_app/screens/diseasePredictionScreens/diseasePrediction.dart';
import 'package:plantdisease_app/screens/tools.dart';
import 'package:plantdisease_app/widgets/templates.dart';

void main() => runApp(AgroApp());

class AgroApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Agro App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SafeArea(
        child: BaseTemplate(),
      ),
    );
  }
}

class BaseTemplate extends StatefulWidget {
  BaseTemplate();
  @override
  _BaseTemplateState createState() => _BaseTemplateState();
}

class _BaseTemplateState extends State<BaseTemplate> {
  int _currentIndex = 0;

  final ToolsSection _toolsPage = ToolsSection();
  final DiseasePrediction _diseasePredictionPage = DiseasePrediction();

  String _appBarText = "Tools";
  Color _appBarColor = Colors.green;
  Widget _showPage = ToolsSection();

  Widget _screenSetter(int index) {
    switch (index) {
      case 0:
        return _toolsPage;
      case 1:
        return _diseasePredictionPage;
    }
  }

  String _appBarTitle(int index) => appBarTitleText[index];
  Color _appBarBGColor(int index) => appBarBackgroundColor[index];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(_appBarText),
        backgroundColor: _appBarColor,
        centerTitle: true,
      ),
      body: _showPage,
      bottomNavigationBar: _bottomNavBar(),
    );
  }

  Widget _bottomNavBar() {
    List<CustomNavigationBarItem> navBarItems = [];
    for (int i = 0; i < navBarIcons.length; i++) {
      navBarItems.add(CustomNavigationBarItem(
        icon: Icon(navBarIcons[i]),
        selectedTitle: NavBarText(navBarTitle[i]),
      ));
    }
    return CustomNavigationBar(
      iconSize: 30.0,
      selectedColor: Colors.white,
      strokeColor: Colors.white,
      unSelectedColor: Color(0xff6c788a),
      backgroundColor: Color(0xff040307),
      items: navBarItems,
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
          _showPage = _screenSetter(index);
          _appBarText = _appBarTitle(index);
          _appBarColor = _appBarBGColor(index);
        });
      },
    );
  }
}
