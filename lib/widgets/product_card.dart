import 'dart:math';
import 'package:flutter/material.dart';
import '../meta/productDetails.dart';

class ProductCard extends StatelessWidget {
  final String name, price, imageAddress, phoneUrl, detail;
  final int category;
  ProductCard({this.name, this.price, this.imageAddress, this.phoneUrl, this.detail, this.category});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Color.fromARGB(255, 255, 255, 240),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: InkWell(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: Image.network(imageAddress,
                    fit: BoxFit.cover,
                    height: 100,
                    width: 100,
                  )
                ),
                Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(name.substring(0, min(70, name.length)), style: TextStyle(
                        color: Colors.black,
                        fontSize: 15
                      ),
                    ),
                    Text(price, style: TextStyle(
                        color: Colors.amber,
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
                Spacer()
              ],
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Sd(
                    nam: name,
                    p: price,
                    img: imageAddress,
                    phn: phoneUrl,
                    details: detail,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
