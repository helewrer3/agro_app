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

var appBarActiveActionTask = {
  0: null,
  1: null,
  2: null,
  3: null,
  4: null,
};

double yield = 0.0;

List<ProductCard> tempList = [
  ProductCard(
    name: "Neem Oil For Spray- a\nnatural ferilizer and \npesticide for plants - \n1000mL",
    price: "₹ 199.00",
    imageAddress: 'https://m.media-amazon.com/images/I/51BRS0h-CJL._AC_SR160,160_.jpg',
    detail: "100 % natural and organic water soluble neem oil, available in pouch of 200 ml Dual purpose in the vegetable garden as both a pesticide and a fungicide. It can safely be used on food, leaves no dangerous residue in the soil and effectively reduces or kills pests Can be used as a beauty supplement and helps reduce redness and inflammation. It is an herbal insecticide used in agricultural sprayers, farming and gardening",
  ),
  ProductCard(
    name: "Bio Toxin Organic Mix\nwith Neem Oil and \nKaranjia Oil for Pest-\n500mL",
    price: "₹ 300.00",
    imageAddress: 'https://m.media-amazon.com/images/I/418aF+GgB8L._AC_SR160,160_.jpg',
    detail: "BioToxin is a Ready to spray, totally safe, organic, environment friendly, biodegradable home garden pesticide. can also be used as a PROTECTIVE spray to prevent future plant pest and disease incidence. No need to mix water and no need for a separate sprayer. This is a ready to spray formulation bottle with an in-built spray nozzle.Controls various insect pests and fungus on potted home garden plants including indoor, semi indoor and outdoor flowering and non-flowering plants. Gives long term pest protection.Made from plant extracts like neem and other medicinal plants, BioToxin is safe to spray on indoor plants. It is completely safe for pest management on garden plants, lawn, flowering plants, vegetable and fruit plants. It does not have a bad odour like normal pesticides",
  ),
  ProductCard(
    name:"Organo Magic Liquid\nBooster Organic for\nall plants- \n5Ltr",
    price:  "₹ 899.00",
    imageAddress: "https://images-na.ssl-images-amazon.com/images/I/71Cff9uhuEL._SX569_.jpg",
    detail: "Organic Magic Liquid Booster rapidly increases quantity of vegetables and flowers, it also enhances quality of product. Keeps them fresh for long time without worrying about them.It is an organic product which is used for growing healthy & safe vegetables and flowers at home.Provides excellent effect on overall plant growth, encourages the growth of new shoots / leaves and improves the quality and shelf life of the produce.It improves soil structure, texture, aeration, and water-holding capacity and prevents soil erosion.",
  ),
  ProductCard(
    name:"Rhbp Organic Liquid\nBio-Fertilizer For\nAll Crops- 1L",
    price:  "₹ 600.00",
    imageAddress: "https://m.media-amazon.com/images/I/51tnMhTqpCL._AC_SR160,160_.jpg",
    detail: "Unique bio-carbon liquid fertilizers suitable for all crops contains 16 essential macro and micro nutrientsSo far the carbon is considered and added as micronutrient. But this is the only and much needed one for plants and crops,with our unique formula each of the element present in our fertilizer plays pivotal role targeting roots, foliage, flowers and fruits/vegetable generically and doesn't limit itself to a particular plant or tree Provides nutrients for flowers, vegetables, trees, shrubs and houseplants.advantages of liquid fertilizer are its more rapid effect and easier coverage Because of its liquid form, intake of the nutrients by plants or trees is expedited. It can be used for home or fields. Unique in market with more organic carbon thereby improving photosynthesis and soil organic carbon (Soc)",
  ),
  ProductCard(
    name:"Gold Dust Mustard Cake\nFertilizer for Plants\nMustard Cake Powder\n1kg",
    price:  "₹ 249.00",
    imageAddress: "https://images-na.ssl-images-amazon.com/images/I/71OQywCsr4L._SL1500_.jpg",
    detail: "Mustard cake fertilizer for plants is Nitrogen (Protein) rich organic fertilizer for home plants.Mustard cake fertilizer also known as sarso ki khali results in shiny leaves and healthier flowers.Mustard Oil Cake Fertilizer is derived from cold pressing our own farm produced mustard seeds locally knowns as sarso khali fertilizer for plant.Mustard cake for plants can be used either directly as dry mustard cake powder or can be used as liquid npk fertilizers for plants.Mustard Cake fertilizer is available in 1Kg , 2Kg ,5 Kg powder and cake form.",
  ),
];