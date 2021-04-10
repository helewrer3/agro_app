import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PredictionData {
  double data;

  PredictionData({
    @required this.data,
  });

  PredictionData.fromJSON(Map<String, dynamic> json) {
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> info = new Map<String, dynamic>();
    info['data'] = this.data;
    return info;
  }
}

class YieldScreen extends StatelessWidget {
  static const routeName = '/yield';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(child: ScreenModel()),
    );
  }
}

class ScreenModel extends StatefulWidget {
  @override
  _ScreenModelState createState() => _ScreenModelState();
}

class _ScreenModelState extends State<ScreenModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Form(
              child: formInterface(),
            ),
          ],
        ),
      )),
    );
  }

  Widget formInterface() {
    double rainfall, temperature, pesticide;
    String item;
    return Column(
      children: <Widget>[
        TextFormField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(hintText: 'Average Rainfall per Year'),
          maxLength: 32,
          // validator: validateName,
          onSaved: (String val) {
            rainfall = double.parse(val);
          },
        ),
        TextFormField(
            decoration: InputDecoration(hintText: 'Air Temperature'),
            keyboardType: TextInputType.number,
            maxLength: 10,
            // validator: validateMobile,
            onSaved: (String val) {
              temperature = double.parse(val);
            }),
        TextFormField(
            decoration: InputDecoration(hintText: 'Pesticide Tonnage'),
            keyboardType: TextInputType.number,
            maxLength: 10,
            // validator: validateEmail,
            onSaved: (String val) {
              pesticide = double.parse(val);
            }),
        TextFormField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(hintText: 'Crop'),
          maxLength: 32,
          // validator: validateName,
          onSaved: (String val) {
            item = val;
          },
        ),
        SizedBox(height: 15.0),
        // ElevatedButton(
        //   onPressed: _sendToServer(rainfall, pesticide, temperature, item),
        //   child: new Text('Send'),
        // )
      ],
    );
  }

  _sendToServer(
      double rainPar, double pestPar, double tempPar, String cropPar) async {
    // https://crop-yield-api.herokuapp.com/?rain=1083.0&temp=16.23&pest=75000.0&item=Cassava

    String url = "https://crop-yield-api.herokuapp.com/?";
    url += "rain=$rainPar&temp=$tempPar&pest=$pestPar&item=$cropPar";
    final response = await http.get(url);
    print(response.body);

    PredictionData predictionData =
        PredictionData.fromJSON(jsonDecode(response.body));

    double cropYield = predictionData.data;
    print(cropYield);
    showDialog(
        context: context,
        builder: (context) {
          return Text("Predicted Yield\n$cropYield");
        });
  }
}
