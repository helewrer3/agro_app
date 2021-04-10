import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vihaan_app/widgets/news_card.dart';

class NewsScreen extends StatefulWidget {
  static const routeName = '/news';
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  bool _isLoading = true;
  List<dynamic> _data;
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((_) async {
      final url = Uri.parse('https://newsapi.org/v2/everything?q=farming&sortBy=publishedAt&apiKey=90dc7110ea6c4813a864710852ee0761');
      var res = await http.get(url);
      _data = json.decode(res.body)['articles'];
      setState(() {
        _isLoading = false;      
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return _isLoading? Center(child: CircularProgressIndicator(),) : SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: _data.map((e) => NewsCard(e)).toList(),
          ),
        ),
      ),
    );
  }
}