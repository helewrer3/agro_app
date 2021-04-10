import 'package:flutter/material.dart';
import 'package:vihaan_app/widgets/product_card.dart';
import '../meta/global_vars.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

class AddProductScreen extends StatelessWidget {
  static const routeName = '/add';
  String title = '', price = '', desc = '', url = '', num = '';
  int category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Enter Details'),
        actions: [
          IconButton(icon: Icon(Icons.save), onPressed: (){
              tempList.add(ProductCard(name: title, imageAddress: url, detail: desc, price: price, phoneUrl: num, category: category));
              Navigator.of(context).pop();
            }
          )
        ],
      ),
      body: Padding(
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
              SizedBox(height: 20,),
              Card(
                elevation: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Category',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300
                        ),
                      ),
                    ),
                    RadioButtonGroup(
                      labels: [
                        "Fertilizers",
                        "Insecticides",
                        "Pesticides",
                      ],
                      onChange: (String label, int index) => category = index,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}