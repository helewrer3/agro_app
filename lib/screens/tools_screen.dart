import 'package:agro_app/meta/constants.dart';
import 'package:agro_app/meta/global_vars.dart';
import 'package:flutter/material.dart';

class ToolsScreen extends StatelessWidget {
  const ToolsScreen({Key? key}) : super(key: key);

  static const routeName = TOOLS_ROUTE;

  Widget barTab(name) {
    return Tab(
      child: Text(
        name,
        style: const TextStyle(
          fontFamily: 'Varela',
          fontSize: 18.0,
        ),
      ),
    );
  }

  Widget tabView(list) {
    return SingleChildScrollView(
      child: Column(
        children: list,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: Categories.values.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TabBar(
                  isScrollable: true,
                  indicatorColor: Colors.black,
                  unselectedLabelColor: Colors.white,
                  labelColor: Colors.black,
                  tabs: Categories.values.map((e) => barTab(e.name)).toList()),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            tabView(demoList),
            for (int i = 1; i < Categories.values.length; i++)
              tabView(demoList.where((e) => e.category == i).toList())
          ],
        ),
      ),
    );
  }
}
