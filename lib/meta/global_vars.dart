import 'package:flutter/material.dart';
import 'package:vihaan_app/screens/add_product_screen.dart';
import 'package:vihaan_app/screens/weather_screen.dart';
import 'package:vihaan_app/widgets/product_card.dart';

const String AUTH0_DOMAIN = 'dev-ji6lcyp5.us.auth0.com';
const String AUTH0_CLIENT_ID = 'hRVLCCU6V7SH4SH4ZuAkRzV2NaM0jPyI';
const String AUTH0_REDIRECT_URI = 'com.auth0.flutterdemo://login-callback';
const String AUTH0_ISSUER = 'https://$AUTH0_DOMAIN';
const String WEATHER_KEY = 'ad6ba04780c2603bc57a9fd63df4c745';
String global_name = '';
String global_imageUrl = '';

var appBarTitleText = {
  0: "Tools",
  1: "Disease Prediction",
  2: "Yield Prediction",
  3: "News",
  4: "Marketplace",
};

var appBarBackgroundColor = {
  0: Colors.green,
  1: Colors.red,
  2: Colors.purple,
  3: Colors.black,
  4: Colors.deepPurple,
};

var navBarIcons = {
  0: Icons.build,
  1: Icons.coronavirus_outlined,
  2: Icons.spa,
  3: Icons.book,
  4: Icons.store,
};

var navBarTitle = {
  0: "Tools",
  1: "Disease",
  2: "Yield",
  3: "News",
  4: "Marketplace",
};

Map<int, Function> appBarActiveActionWidget = {
  0: (BuildContext ctx){return Text('');},
  1: (BuildContext ctx){return IconButton(icon: Icon(Icons.add_a_photo), onPressed: null);},
  2: (BuildContext ctx){return Text('');},
  3: (BuildContext ctx){return IconButton(icon: Icon(Icons.cloud), onPressed: (){Navigator.of(ctx).pushNamed(WeatherScreen.routeName);});},
  4: (BuildContext ctx){return IconButton(icon: Icon(Icons.add), onPressed: (){Navigator.of(ctx).pushNamed(AddProductScreen.routeName);});},
};

Map<int, String> categories = {
  0: 'Fertilizers',
  1: 'Insecticides',
  2: 'Pesticides'
};

List<ProductCard> tempList = [
  ProductCard(
    name: "Alagaezyme Pure Neem Oil\nfor Plant pesticides pest\nControl (250ml)",
    price: "₹ 239.00",
    imageAddress: 'https://m.media-amazon.com/images/I/71dRYM4NxzL._AC_UL320_.jpg',
    phoneUrl: "tel:21213123123",
    detail: " Neem oil kills some pests like whitefly, aphids, Japanese beetles, moth larvae, scale, and spider mites. Neem oil are also used as fungicides against rust, black spot, mildew, leaf spot, scab, anthracnose, blight, and botrytis. Besides being an organic insecticide, using this product allows you to target pests specifically as opposed to beneficial insects such as bees and lady beetles(bees and lady beetles do not eat plant leaves).Take 4-6 ml of this concentrated Neem oil in 1 litter of water and stirr well to get its emulsified form.",
    category: 2,
  ),
  ProductCard(
    name: "T R Agro Neem\nOil, Organic Insecticide for\nGardening and Farming\n50mL",
    price: "₹ 110.00",
    imageAddress: 'https://images-na.ssl-images-amazon.com/images/I/413mz9plbHL.jpg',
    phoneUrl: "tel:21213123123",
    detail: "It increases growth and development of plants Preventing damage by insects and diseases environmental Better Growths for Plants Neem Kawach reduces risk of Plant failure It can be used in agricultural fields, household gardens, infected Plants Trees",
    category: 1,
  ),
  ProductCard(
    name: "Neem Oil For Spray- a\nnatural ferilizer and \npesticide for plants - \n1000mL",
    price: "₹ 199.00",
    imageAddress: 'https://m.media-amazon.com/images/I/51BRS0h-CJL._AC_SR160,160_.jpg',
    phoneUrl: "tel:21213123123",
    detail: "100 % natural and organic water soluble neem oil, available in pouch of 200 ml Dual purpose in the vegetable garden as both a pesticide and a fungicide. It can safely be used on food, leaves no dangerous residue in the soil and effectively reduces or kills pests Can be used as a beauty supplement and helps reduce redness and inflammation. It is an herbal insecticide used in agricultural sprayers, farming and gardening",
    category: 0,
  ),
];

var appBarActiveActionTask = {
  0: null,
  1: null,
  2: null,
  3: null,
  4: null,
};