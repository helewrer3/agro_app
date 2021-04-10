import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  final dynamic e;
  NewsCard(this.e);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 4.0),
      child: Card(
        elevation: 10,
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Container(
            padding: const EdgeInsets.all(8),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  e['title'],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Divider(height: 10),
                ),
                Text(
                  e['description'],
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
