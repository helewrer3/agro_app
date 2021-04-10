import 'package:flutter/material.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:vihaan_app/screens/disease_screen.dart';
import 'package:vihaan_app/screens/marketplace_screen.dart';
import 'package:vihaan_app/screens/news_screen.dart';
import 'package:vihaan_app/screens/tools_screen.dart';
import 'package:vihaan_app/screens/yield_screen.dart';
import 'package:vihaan_app/widgets/main_drawer.dart';
import '../meta/global_vars.dart';
import '../widgets/templates.dart';

class BaseScreen extends StatefulWidget {
  static const routeName = '/base';
  BaseScreen();
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _currentIndex = 0;
  final ToolsScreen _toolsPage = ToolsScreen();
  final DiseasePrediction _diseasePredictionPage = DiseasePrediction();
  final NewsScreen _newsPage = NewsScreen();
  final YieldScreen _yieldPage = YieldScreen();
  final MarketplaceScreen _marketplaceScreen = MarketplaceScreen();

  String _appBarText = "Tools";
  Color _appBarColor = Colors.green;
  Widget _showPage = ToolsScreen();
  Widget _appBarAction = Text("");

  Widget _screenSetter(int index) {
    switch (index) {
      case 0:
        return _toolsPage;
      case 1:
        return _diseasePredictionPage;
      case 2:
        return _yieldPage;
      case 3:
        return _newsPage;
      case 4:
        return _marketplaceScreen;
    }
  }

  String _appBarTitle(int index) => appBarTitleText[index];
  Color _appBarBGColor(int index) => appBarBackgroundColor[index];
  Widget _appBarActiveAction(int index, BuildContext ctx) =>
      appBarActiveActionWidget[index](ctx);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(_appBarText),
          backgroundColor: _appBarColor,
          centerTitle: true,
          actions: [InkWell(onTap: null, child: _appBarAction)],
        ),
        body: _showPage,
        drawer: MainDrawer(),
        bottomNavigationBar: _bottomNavBar(),
      ),
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
          _appBarAction = _appBarActiveAction(index, context);
        });
      },
    );
  }
}
