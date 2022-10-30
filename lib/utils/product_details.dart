import 'package:agro_app/meta/constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductDetails extends StatelessWidget {
  final String name, price, imgAddr, phnUrl, detail;
  final int category;

  const ProductDetails(
      {super.key,
      required this.name,
      required this.price,
      required this.imgAddr,
      required this.phnUrl,
      required this.detail,
      required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: const Text(PRODUCT),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Varela',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Image.network(
              imgAddr,
              height: 150,
              fit: BoxFit.fitWidth,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                price,
                style: const TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Varela',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                detail,
                style: const TextStyle(
                  color: Colors.blueGrey,
                  fontFamily: 'Source Sans Pro',
                  fontSize: 15.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: InkWell(
                child: const Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 22,
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 30.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.black,
                    ),
                    title: Text(
                      'Contact Dealer',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Source Sans Pro',
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                onTap: () => launchUrl(Uri.parse(phnUrl)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
