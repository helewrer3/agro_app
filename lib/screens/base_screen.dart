import 'package:agro_app/meta/constants.dart';
import 'package:agro_app/meta/global_vars.dart';
import 'package:agro_app/screens/disease_screen.dart';
import 'package:agro_app/screens/marketplace_screen.dart';
import 'package:agro_app/screens/news_screen.dart';
import 'package:agro_app/screens/tools_screen.dart';
import 'package:agro_app/screens/yield_screen.dart';
import 'package:agro_app/services/auth_service.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  static const routeName = BASE_ROUTE;

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _currentIndex = 0;
  late String _appBarText;
  late Color _appBarColor;
  late Widget _showPage, _appBarAction;
  late List<Widget> _screenList;

  @override
  void initState() {
    _appBarText = setAppBarText(_currentIndex);
    _appBarColor = setAppBarColor(_currentIndex);
    _appBarAction = setAppBarAction(_currentIndex);
    _screenList = [
      const ToolsScreen(),
      const DiseaseScreen(),
      // const YieldScreen(),
      const NewsScreen(),
      const MarketplaceScreen()
    ];
    _showPage = setPage(_currentIndex);
    super.initState();
  }

  String setAppBarText(int idx) => screenMeta[idx]![TITLE] as String;
  
  String setNavBarText(int idx) => screenMeta[idx]![NAVBAR_NAME] as String;
  
  IconData setNavBarIcon(int idx) => screenMeta[idx]![NAVBAR_ICON] as IconData;

  Color setAppBarColor(int idx) => screenMeta[idx]![APPBAR_COLOR] as Color;

  Widget setPage(int idx) => _screenList[idx];

  Widget setAppBarAction(int idx) =>
      (screenMeta[idx]![APPBAR_ACTIVE_ACTION_WIDGET] as Function)(context)
          as Widget;

  Widget _bottomNavBar() {
    List<CustomNavigationBarItem> navBarItems = [];
    for (int i = 0; i < _screenList.length; i++) {
      navBarItems.add(CustomNavigationBarItem(
        icon: Icon(setNavBarIcon(i)),
        selectedTitle: Text(
          setNavBarText(i),
          style: const TextStyle(color: Colors.white),
        ),
      ));
    }

    return CustomNavigationBar(
      iconSize: 30.0,
      selectedColor: Colors.white,
      strokeColor: Colors.white,
      unSelectedColor: Colors.grey,
      backgroundColor: Colors.black87,
      items: navBarItems,
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
          _showPage = setPage(index);
          _appBarText = setAppBarText(index);
          _appBarColor = setAppBarColor(index);
          _appBarAction = setAppBarAction(index);
        });
      },
    );
  }

  Widget _mainDrawer() {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
              accountName: const Text(WELCOME),
              accountEmail: Text(globalName ?? NONE_TEXT),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(globalImageUrl ?? NONE_TEXT),
              ),
            otherAccountsPictures: [
              IconButton(icon: const Icon(Icons.logout), onPressed: () async {
                await AuthService.instance.deleteRefreshToken();
                Navigator.of(context).pushReplacementNamed('/');
              })
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text(_appBarText),
        backgroundColor: _appBarColor,
        centerTitle: true,
        actions: [InkWell(onTap: null, child: _appBarAction)],
      ),
      body: _showPage,
      drawer: _mainDrawer(),
      bottomNavigationBar: _bottomNavBar(),
    );
  }
}
