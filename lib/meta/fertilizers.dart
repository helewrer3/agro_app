import 'package:flutter/material.dart';
import '../widgets/product_card.dart';


class Fertilizers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
      ]
    );
  }
}
