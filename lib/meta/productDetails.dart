import 'package:flutter/material.dart';

class Sd extends StatelessWidget {
  final img,nam,p,details;
  Sd({this.img,
  this.nam,
  this.p,
  this.details});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.orange[200],

     // backgroundColor: Colors.yellow[800],
      appBar: AppBar(
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(Icons.arrow_back, color: Colors.white),
      ),
      centerTitle: true,
      backgroundColor: Colors.deepOrange[200],
      title: Text('Product'),
      
        ),

        body: SafeArea(
          
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[

           Padding(
           padding: EdgeInsets.all(10.0),
           child: Text(
             nam,
            style: TextStyle(
             fontSize: 30.0,
             fontFamily: 'Varela',
             fontWeight: FontWeight.bold,
            ),
           ),
          ),

          Image.network(
           img,
           height: 150,
           fit: BoxFit.fitWidth,
            ),

          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              p,
             style: TextStyle(
              fontSize: 30.0,
              fontFamily: 'Varela',
              fontWeight: FontWeight.bold,
             ),
            ),
          ),
           
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              details,
               style: TextStyle(
                color: Colors.blueGrey[800],
                fontFamily: 'Source Sans Pro',
                fontSize: 15.0,
               ),
              ),
          ),

          Card(
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
          ],
        ),
      ),
    ),
          
        

    );
  }
}
