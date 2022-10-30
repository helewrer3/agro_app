import 'package:agro_app/meta/constants.dart';
import 'package:agro_app/meta/global_vars.dart';
import 'package:agro_app/utils/product_card.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatelessWidget {
  AddProductScreen({Key? key}) : super(key: key);

  static const routeName = ADD_ROUTE;

  String name = '', price = '', imgAddr = '', phnUrl = '', detail = '';
  int category = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(ENTER_DETAILS),
        actions: [
          IconButton(
              onPressed: () {
                if (category != 0) {
                  demoList.add(ProductCard(
                      name: name,
                      price: price,
                      imgAddr: imgAddr,
                      phnUrl: phnUrl,
                      detail: detail,
                      category: category));
                }
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: ListView(
            children: [
              TextFormField(
                  decoration: const InputDecoration(labelText: 'Title'),
                  textInputAction: TextInputAction.next,
                  onChanged: (val) => name = val),
              TextFormField(
                  decoration: const InputDecoration(labelText: 'Price'),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  onChanged: (val) => price = '₹ $val'),
              TextFormField(
                  decoration: const InputDecoration(labelText: 'Number'),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  onChanged: (val) => phnUrl = 'tel:$val'),
              TextFormField(
                  decoration: const InputDecoration(labelText: 'Description'),
                  textInputAction: TextInputAction.next,
                  maxLines: 3,
                  keyboardType: TextInputType.multiline,
                  onChanged: (val) => detail = val),
              TextFormField(
                  decoration: const InputDecoration(labelText: 'Image URL'),
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.url,
                  onChanged: (val) => imgAddr = val),
              const SizedBox(height: 20),
              Card(
                elevation: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Category',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w300),
                      ),
                    ),
                    CustomRadioButton(
                      elevation: 2,
                      absoluteZeroSpacing: false,
                      unSelectedColor: Theme.of(context).canvasColor,
                      buttonLables: Categories.values
                          .map((e) => e.name)
                          .toList()
                          .sublist(1),
                      buttonValues: Categories.values
                          .map((e) => e.index)
                          .toList()
                          .sublist(1),
                      buttonTextStyle: const ButtonTextStyle(
                          selectedColor: Colors.white,
                          unSelectedColor: Colors.black,
                          textStyle: TextStyle(fontSize: 16)),
                      radioButtonValue: (value) {
                        category = value;
                      },
                      selectedColor: Theme.of(context).colorScheme.secondary,
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
