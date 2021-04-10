import 'package:flutter/material.dart';
import '../meta/productDetails.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String imageAddress;
  final String detail;
  ProductCard({this.name, this.price, this.imageAddress, this.detail});
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
                        child: Image.network(
                          imageAddress,
                          height: 150,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(name, 
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Varela',
                              fontSize: 17.0,
                            ),
                          ),
                          SizedBox(height: 12,),
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
