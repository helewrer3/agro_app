import 'package:flutter/material.dart';

class Cure extends StatelessWidget {
  String diseaseName;
  Cure(this.diseaseName);
  final disease = {
    "Apple - Apple Scab":
        "Choose resistant varieties when possible. Rake under trees and destroy infected leaves to reduce the number of fungal spores available to start the disease cycle over again next spring. Water in the evening or early morning hours (avoid overhead irrigation) to give the leaves time to dry out before infection can occur.",
    "Apple - Black Rot":
        "Fungicides like copper-based sprays and lime sulfur, can be used to control black rot.",
    "Apple - Apple Cedar Rust":
        "Remove galls from infected junipers. In some cases, juniper plants should be removed entirely. Apply preventative, disease-fighting fungicides labeled for use on apples weekly, starting with bud break, to protect trees from spores being released by the juniper host.",
    "Cherry - Powdery Mildew":
        "Keep irrigation water off developing fruit and leaves by using irrigation that does not wet the leaves. Also, keep irrigation sets as short as possible. Follow cultural practices that promote good air circulation, such as pruning, and moderate shoot growth through judicious nitrogen management.",
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Disease Recognition'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Cure : ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Text(disease[diseaseName]),
            ),
          ],
        ),
      ),
    );
  }
}
