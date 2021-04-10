import 'package:flutter/material.dart';
import '../widgets/product_card.dart';

class Pesticides extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductCard(
         name: "Alagaezyme Pure Neem Oil\nfor Plant pesticides pest\nControl (250ml)",
          price: "₹ 239.00",
          imageAddress: 'https://m.media-amazon.com/images/I/71dRYM4NxzL._AC_UL320_.jpg',
          detail: " Neem oil kills some pests like whitefly, aphids, Japanese beetles, moth larvae, scale, and spider mites. Neem oil are also used as fungicides against rust, black spot, mildew, leaf spot, scab, anthracnose, blight, and botrytis. Besides being an organic insecticide, using this product allows you to target pests specifically as opposed to beneficial insects such as bees and lady beetles(bees and lady beetles do not eat plant leaves).Take 4-6 ml of this concentrated Neem oil in 1 litter of water and stirr well to get its emulsified form."
        ),
        ProductCard(
          name: "SURYA Organic Neem\nOil Pesticide Emulsified\n1L",
          price: "₹ 475.00",
          imageAddress: 'https://images-na.ssl-images-amazon.com/images/I/81hP-hzt9zL._SL1500_.jpg',
          detail: "Organic pesticide neem oil neem is a concentrated neem oil formulation mixed with emulsifiers for ready use.active ingredients- cold pressed concentrated neem oil, with a higher concentration of azadirachtin Neem mainly affects chewing and sucking insects. Neem is effective in controlling black spot, powdery mildew,anthracnose and rust fungi It is also effective against mealy bug, beet armyworm, aphids, cabbage worm, thrips, whiteflies, mites,fungus gnats, beetle",
        ),
        ProductCard(
          name:"SAKTIMA Pesticide\nEmulsified Neem Oil\n1 L",
          price:  "₹ 430.00",
          imageAddress: "https://images-na.ssl-images-amazon.com/images/I/617F-fGoDyL._SL1152_.jpg",
          detail: "Organic pesticide neem oil neem is a concentrated neem oil formulation mixed with emulsifiers for ready use.active ingredients- cold pressed concentrated neem oil, with a higher concentration of azadirachtin",
        ),
        ProductCard(
          name:"Thiamethoxam 30% FS\n1L",
          price:  "₹ 2000.00",
          imageAddress: "https://images-na.ssl-images-amazon.com/images/I/71QqE1JcX4L._SY879_.jpg",
          detail: "Unique bio-carbon liquid pesticides suitable for all crops contains 16 essential macro and micro nutrientsSo far the carbon is considered and added as micronutrient. But this is the only and much needed one for plants and crops,with our unique formula each of the element present in our fertilizer plays pivotal role targeting roots, foliage, flowers and fruits/vegetable generically and doesn't limit itself to a particular plant or tree Provides nutrients for flowers, vegetables, trees, shrubs and houseplants.advantages of liquid fertilizer are its more rapid effect and easier coverage Because of its liquid form, intake of the nutrients by plants or trees is expedited. It can be used for home or fields. Unique in market with more organic carbon thereby improving photosynthesis and soil organic carbon (Soc)",
          
        ),
      ]
    );
  }
}

