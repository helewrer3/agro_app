import 'package:flutter/material.dart';
import '../widgets/product_card.dart';


class Insecticide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductCard(
         name: "T R Agro Neem\nOil, Organic Insecticide for\nGardening and Farming\n50mL",
          price: "₹ 110.00",
          imageAddress: 'https://images-na.ssl-images-amazon.com/images/I/413mz9plbHL.jpg',
          detail: "It increases growth and development of plants Preventing damage by insects and diseases environmental Better Growths for Plants Neem Kawach reduces risk of Plant failure It can be used in agricultural fields, household gardens, infected Plants Trees",
          ),
          ProductCard(
          name: "Cocopeat Block expand\nto 75 litres of Coco\nPEAT Powder",
          price: "₹ 340.00",
          imageAddress: 'https://images-na.ssl-images-amazon.com/images/I/71SMYNUItvL._SL1500_.jpg',
          detail:"Made from Coconut Husks; Retains moisture up to 70%. Ideal growing media for plantsTrust Basket Coco Peat Blocks will Expandable up to 75 liters", ),
          ProductCard(
          name:"Zaena Natural Organic\nSoil Insect Controller\nLiquid 500 ml",
          price:  "₹ 430.00",
          imageAddress: "https://images-na.ssl-images-amazon.com/images/I/51PEJRBtk2L._SX679_.jpg",
          detail: "There are wide range of pests that would like nothing more than to ruin the look and health of your crops. But with one simple step, you can keep your crop looking healthy and growing strong.For use on lawns or grounds, in plants intended for aesthetic purposes or climate modification and being grown in interior plantscapes.he natural and effective alternative to chemical pesticides, and have no detrimental effect on non-target species such as ladybugs, earth worms and other helpful garden insects. This makes nematode use for insect pest control safe and environmentally friendly.", ),
         
      ]
    );
  }
}
