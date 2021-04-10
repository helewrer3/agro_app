import 'package:flutter/material.dart';
import '../meta/global_vars.dart';

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
                  BarTab(name: 'All'),
                  for (int i = 0; i < 3; i++) BarTab(name: categories[i])
                ],
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TabView(list: tempList),
            for (int i = 0; i < 3; i++)
              TabView(
                  list: tempList
                      .where((element) => element.category == i)
                      .toList())
          ],
        ),
      ),
    );
  }
}

class TabView extends StatelessWidget {
  final List<Widget> list;
  const TabView({
    Key key,
    this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: list,
        ),
      ),
    );
  }
}

class BarTab extends StatelessWidget {
  final String name;
  const BarTab({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        name,
        style: TextStyle(
          fontFamily: 'Varela',
          fontSize: 18.0,
        ),
      ),
    );
  }
}
