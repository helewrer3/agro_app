import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart';

class YieldScreen extends StatefulWidget {
  static const routeName = '/yield_add';
  @override
  _YieldScreenState createState() => _YieldScreenState();
}

class _YieldScreenState extends State<YieldScreen> {
  String cropYield;
  double rainfall, temperature, pesticide;
  String item;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: ListView(
            children: [
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: 'Average Rainfall per Year'),
                maxLength: 32,
                onChanged: (String val) { rainfall = double.parse(val);},
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'Air Temperature'),
                keyboardType: TextInputType.number,
                maxLength: 10,
                onChanged: (String val) {temperature = double.parse(val);}
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'Pesticide Tonnage'),
                keyboardType: TextInputType.number,
                maxLength: 10,
                onChanged: (String val) {pesticide = double.parse(val);}
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(hintText: 'Crop'),
                maxLength: 32,
                onChanged: (String val) {item = val;},
              ),
              SizedBox(height: 15.0),
              ElevatedButton(
                onPressed: () async {
                  print("Hello");
                  await _sendToServer(rainfall, pesticide, temperature, item);
                },
                child: Text('Send'),
              ),
              SizedBox(height: 15.0),
              Align(child: Text('Expected Yield: $cropYield' ?? ''), alignment: Alignment.center,)
            ],
          ),
        ),
      )
    );
  }
  
  Future<void> _sendToServer(double rainPar, double pestPar, double tempPar, String cropPar) async {
    //https://crop-yield-api.herokuapp.com/?rain=1083.0&temp=16.23&pest=75000.0&item=Cassava
    Uri url = Uri.parse("https://crop-yield-api.herokuapp.com/?rain=$rainPar&temp=$tempPar&pest=$pestPar&item=$cropPar");
    final response = await http.get(url);
    var doc = parse(response.body).body;
    print(doc.innerHtml);
    setState(() {    
      cropYield = doc.innerHtml;
    });
  }
}
