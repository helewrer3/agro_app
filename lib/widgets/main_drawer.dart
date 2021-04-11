import 'package:flutter/material.dart';
import 'package:vihaan_app/screens/news_screen.dart';
import '../meta/global_vars.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:vihaan_app/screens/tools_screen.dart';
import 'drawer_tile.dart';
const FlutterSecureStorage secureStorage = FlutterSecureStorage();

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(global_name), 
            accountEmail: Text('Welcome!'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(global_imageUrl ?? ''),
            ),
            otherAccountsPictures: [  
              IconButton(icon: Icon(Icons.logout), onPressed: () async {
                await secureStorage.delete(key: 'refresh_token');
                Navigator.of(context).pushReplacementNamed('/');
              })
            ],
          ),
          // SingleChildScrollView(
          //   child: Column(
          //     children: [
          //       DrawerTile(title: 'Tools Section', route: ToolsScreen.routeName),
          //       DrawerTile(title: 'News Section', route: NewsScreen.routeName)
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}

