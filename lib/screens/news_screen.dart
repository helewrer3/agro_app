import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:agro_app/meta/constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  static const routeName = NEWS_ROUTE;

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  late bool _isLoading;
  late List<dynamic> _data;

  @override
  void initState() {
    try {
      setState(() {
        _isLoading = true;
      });
      Future.delayed(Duration.zero).then((_) async {
        var res =
            await http.get(Uri.parse(NEWS_PROVIDER), headers: {'x-api-key': NEWS_SECRET});
        _data = json.decode(res.body)[ARTICLES];
        setState(() {
          _isLoading = false;
        });
        print(_data);
      });
    } catch (e) {
      print(e);
      setState(() {
        _isLoading = false;
      });
    }
    super.initState();
  }

  Widget newsCard(e) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 4.0),
      child: Card(
        elevation: 10,
        child: InkWell(
          onTap: () async {
            await launchUrl(Uri.parse(e[LINK]));
          },
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              padding: const EdgeInsets.all(8),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    e[TITLE],
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Divider(height: 10),
                  ),
                  Text(
                    e[DESCRIPTION],
                    style: const TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: _data
                .map((e) => newsCard(e)).toList(),
          ),
        ),
      );
    }
  }
}
