import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  final dynamic e;
  NewsCard(this.e);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        padding: const EdgeInsets.all(8),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(e['title'],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),
            ),
            Divider(height: 10),
            Text(e['description'],
              style: TextStyle(
                fontSize: 15
              ),
            ),
          ],
        ),
      ),
    );
  }
}