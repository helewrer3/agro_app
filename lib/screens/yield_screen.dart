import 'package:http/http.dart' as http;

import 'package:agro_app/meta/constants.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';

class YieldScreen extends StatefulWidget {
  const YieldScreen({Key? key}) : super(key: key);

  static const routeName = YIELD_ROUTE;

  @override
  State<YieldScreen> createState() => _YieldScreenState();
}

class _YieldScreenState extends State<YieldScreen> {
  late String _cropYield;
  late String _item;
  late double _rainfall, _temperature, _pesticide;
  late bool _isLoading;

  @override
  void initState() {
    setState(() {
      _cropYield = NONE_TEXT;
      _isLoading = false;
    });
    super.initState();
  }

  Future<void> _sendToServer() async {
    setState(() {
      _isLoading = true;
    });
    try {
      var pestPar = _pesticide * 150000;
      Uri url = Uri.parse(
          "$YIELD_PROVIDER/?rain=$_rainfall&temp=$_temperature&pest=$pestPar&item=$_item");
      final response = await http.get(url);
      var doc = parse(response.body).body;
      setState(() {
        _cropYield = 'Expected Yield: ${doc!.innerHtml} hg/ha';
      });
    } catch (e) {
      print(e);
      setState(() {
        _cropYield = ERROR;
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Form(
          child: ListView(
            children: [
              TextFormField(
                keyboardType: TextInputType.number,
                decoration:
                    const InputDecoration(hintText: AVG_RAINFALL_YEARLY),
                maxLength: 32,
                onChanged: (String val) {
                  _rainfall = double.parse(val);
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: AIR_TEMP),
                maxLength: 10,
                onChanged: (String val) {
                  _temperature = double.parse(val);
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: PESTICIDE),
                maxLength: 10,
                onChanged: (String val) {
                  _pesticide = double.parse(val);
                },
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(hintText: CROP),
                maxLength: 32,
                onChanged: (String val) {
                  _item = val;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: ElevatedButton(
                  child: const Text(SEND),
                  onPressed: () async {
                    await _sendToServer();
                  },
                ),
              ),
              _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Align(
                      alignment: Alignment.center,
                      child: Text(_cropYield),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
