import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final String title, route, desc;
  DrawerTile({this.title, this.route, this.desc = ''});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Text(desc),
      onTap: (){
        Navigator.of(context).pushReplacementNamed(route);
      },
    );
  }
}