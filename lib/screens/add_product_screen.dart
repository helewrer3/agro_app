import 'package:flutter/material.dart';
import 'package:vihaan_app/widgets/product_card.dart';
import '../meta/global_vars.dart';

class AddProductScreen extends StatelessWidget {
  static const routeName = '/add';
  String title = '', price = '', desc = '', url = '', num = '';
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Title'),
                textInputAction: TextInputAction.next,
                onChanged: (val){title = val;},
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Price'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                onChanged: (val){price = '₹ $val';},
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Number'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                onChanged: (val){price = '$num';},
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                textInputAction: TextInputAction.next,
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                onChanged: (val){desc = val;},
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Image URL'),
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.url,
                onChanged: (val){url = val;},
              ),
              SizedBox(height: 20),
              RaisedButton(onPressed: (){
                tempList.add(ProductCard(name: title, imageAddress: url, detail: desc, price: price, phoneUrl: num,));
                Navigator.of(context).pop();
              }, child: Text('Save Form'))
            ],
          ),
        ),
      ),
    );
  }
}