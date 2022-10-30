import 'dart:math';

import 'package:agro_app/utils/product_details.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name, price, imgAddr, phnUrl, detail;
  final int category;

  const ProductCard(
      {super.key,
      required this.name,
      required this.price,
      required this.imgAddr,
      required this.phnUrl,
      required this.detail,
      required this.category});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: InkWell(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.network(
                imgAddr,
                fit: BoxFit.cover,
                height: 100,
                width: 100,
              ),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    name.substring(0, min(70, name.length)),
                    style: const TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  Text(
                    price,
                    style: const TextStyle(
                        color: Colors.amber,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const Spacer()
            ],
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProductDetails(
                    name: name,
                    price: price,
                    imgAddr: imgAddr,
                    phnUrl: phnUrl,
                    detail: detail,
                    category: category)));
          },
        ),
      ),
    );
  }
}
