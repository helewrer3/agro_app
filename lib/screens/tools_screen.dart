import 'package:flutter/material.dart';
import 'package:vihaan_app/meta/global_vars.dart';
import '../meta/all.dart';
import '../meta/fertilizers.dart';
import '../meta/insecticides.dart';
import '../meta/pesticides.dart';

class ToolsScreen extends StatelessWidget {
  static const routeName = '/tools';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: appBarBackgroundColor[0],
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TabBar(
                isScrollable: true,
                indicatorColor: Colors.black,
                unselectedLabelColor: Colors.white,
                labelColor: Colors.black,
                tabs: [
                  BarTab(s: 'All'),
                  BarTab(s: 'Fertilizers'),
                  BarTab(s: 'Pesticides'),
                  BarTab(s: 'Insecticides'),
                ],
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TabView(
              screen: All(),
            ),
            TabView(
              screen: Fertilizers(),
            ),
            TabView(
              screen: Pesticides(),
            ),
            TabView(
              screen: Insecticide(),
            ),
          ],
        ),
      ),
    );
  }
}

class TabView extends StatelessWidget {
  final Widget screen;
  const TabView({
    Key key,
    this.screen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: screen,
      ),
    );
  }
}

class BarTab extends StatelessWidget {
  final String s;
  const BarTab({Key key, this.s}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        s,
        style: TextStyle(
          fontFamily: 'Varela',
          fontSize: 18.0,
        ),
      ),
    );
  }
}
