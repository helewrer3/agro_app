import 'package:agro_app/meta/constants.dart';
import 'package:agro_app/screens/add_product_screen.dart';
import 'package:agro_app/utils/product_card.dart';
import 'package:flutter/material.dart';

import '../screens/weather_screen.dart';

String? globalName, globalImageUrl;
var screenMeta = {
  0: {
    TITLE: TOOLS,
    NAVBAR_NAME: TOOLS,
    NAVBAR_ICON: Icons.build,
    APPBAR_COLOR: Colors.green,
    APPBAR_ACTIVE_ACTION_WIDGET: (BuildContext ctx) {
      return const Text(NONE_TEXT);
    }
  },
  1: {
    TITLE: DISEASE_PREDICTION,
    NAVBAR_NAME: DISEASE,
    NAVBAR_ICON: Icons.coronavirus_outlined,
    APPBAR_COLOR: Colors.red,
    APPBAR_ACTIVE_ACTION_WIDGET: (BuildContext ctx) {
      return const IconButton(icon: Icon(Icons.add_a_photo), onPressed: null);
    },
  },
  2: {
    TITLE: YIELD_PREDICTION,
    NAVBAR_NAME: YIELD,
    NAVBAR_ICON: Icons.spa,
    APPBAR_COLOR: Colors.purple,
    APPBAR_ACTIVE_ACTION_WIDGET: (BuildContext ctx) {
      return const Text(NONE_TEXT);
    },
  },
  3: {
    TITLE: NEWS,
    NAVBAR_NAME: NEWS,
    APPBAR_COLOR: Colors.black,
    NAVBAR_ICON: Icons.book,
    APPBAR_ACTIVE_ACTION_WIDGET: (BuildContext ctx) {
      return IconButton(
          icon: const Icon(Icons.cloud),
          onPressed: () {
            Navigator.of(ctx).pushNamed(WeatherScreen.routeName);
          });
    },
  },
  4: {
    TITLE: MARKETPLACE,
    NAVBAR_NAME: MARKETPLACE,
    NAVBAR_ICON: Icons.store,
    APPBAR_COLOR: Colors.yellow,
    APPBAR_ACTIVE_ACTION_WIDGET: (BuildContext ctx) {
      return IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            Navigator.of(ctx).pushNamed(AddProductScreen.routeName);
          });
    },
  },
};

var demoList = <ProductCard>[
  ProductCard(
    name:
        "Alagaezyme Pure Neem Oil\nfor Plant pesticides pest\nControl (250ml)",
    price: "₹ 239.00",
    imgAddr: 'https://m.media-amazon.com/images/I/71dRYM4NxzL._AC_UL320_.jpg',
    phnUrl: "tel:21213123123",
    detail:
        " Neem oil kills some pests like whitefly, aphids, Japanese beetles, moth larvae, scale, and spider mites. Neem oil are also used as fungicides against rust, black spot, mildew, leaf spot, scab, anthracnose, blight, and botrytis. Besides being an organic insecticide, using this product allows you to target pests specifically as opposed to beneficial insects such as bees and lady beetles(bees and lady beetles do not eat plant leaves).Take 4-6 ml of this concentrated Neem oil in 1 litter of water and stirr well to get its emulsified form.",
    category: Categories.fertilizers.index,
  ),
];

var demoDiseases = {
  "Apple - Apple Scab":
      "Choose resistant varieties when possible. Rake under trees and destroy infected leaves to reduce the number of fungal spores available to start the disease cycle over again next spring. Water in the evening or early morning hours (avoid overhead irrigation) to give the leaves time to dry out before infection can occur.",
  "Apple - Black Rot":
      "Fungicides like copper-based sprays and lime sulfur, can be used to control black rot.",
  "Apple - Apple Cedar Rust":
      "Remove galls from infected junipers. In some cases, juniper plants should be removed entirely. Apply preventative, disease-fighting fungicides labeled for use on apples weekly, starting with bud break, to protect trees from spores being released by the juniper host.",
  "Cherry - Powdery Mildew":
      "keep irrigation water off developing fruit and leaves by using irrigation that does not wet the leaves. Also, keep irrigation sets as short as possible. Follow cultural practices that promote good air circulation, such as pruning, and moderate shoot growth through judicious nitrogen management.",
  "Grape - Black Measles":
      "Lime sulfur sprays can manage the trio of pathogens that cause black measles.",
  "Grape - Leaf Blight":
      "Fungicides sprayed for other diseases in the season may help to reduce this disease.",
  "Potato - Early Blight":
      "Avoid overhead irrigation. Do not dig tubers until they are fully mature in order to prevent damage. Do not use a field for potatoes that was used for potatoes or tomatoes the previous year.",
  "Potato - Late Blight":
      "Fungicides are available for management of late blight on potato.",
  "Tomato - Spider Mite":
      "A natural way to kill spider mites on your plants is to mix one part rubbing alcohol with one part water, then spray the leaves. The alcohol will kill the mites without harming the plants. Another natural solution to get rid of these tiny pests is to use liquid dish soap.",
  "Tomato - Curl Virus":
      "Treatment for this disease include insecticides, hybrid seeds, and growing tomatoes under greenhouse conditions.",
  "Tomato - Leaf Mold":
      "By adequating row and plant spacing that promote better air circulation through the canopy reducing the humidity; preventing excessive nitrogen on fertilization since nitrogen out of balance enhances foliage disease development.",
  "Strawberry - Leaf Scorch":
      "Remove foliage and crop residues after picking or at renovation to remove inoculum and delay disease increase in late summer and fall. Fungicide treatments are effective during the flowering period, and during late summer and fall.",
};

enum Categories {
  all(ALL),
  fertilizers(FERTILIZERS),
  pesticides(PESTICIDES),
  insecticides(INSECTICIDES);

  const Categories(this.name);

  final String name;
}
