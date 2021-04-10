import 'package:flutter/material.dart';
import '../meta/productDetails.dart';

class ProductCard extends StatelessWidget {
  final String name, price, imageAddress, phoneUrl, detail;
  final int category;
  ProductCard({this.name, this.price, this.imageAddress, this.phoneUrl, this.detail, this.category});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: InkWell(
          child: Container(      
            width: MediaQuery.of(context).size.width,
            child: FittedBox(
              child: Material(
                color: Colors.orange[200],
                elevation: 16.0,
                borderRadius: BorderRadius.circular(12),
                shadowColor: Colors.black,
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(imageAddress,
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text( name,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Varela',
                              fontSize: 17.0,
                            ),
                          ),       
                          SizedBox(height: 12),
                          Text(price,
                            style: TextStyle(
                              color: Colors.amber[900],
                              fontFamily: 'Varela',
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),  
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
    );
  }
}
