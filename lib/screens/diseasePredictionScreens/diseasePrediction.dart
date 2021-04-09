import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'package:flutter/services.dart';
import 'cure.dart';

class DiseasePrediction extends StatefulWidget {
  @override
  _DiseasePredictionState createState() => _DiseasePredictionState();
}

class _DiseasePredictionState extends State<DiseasePrediction> {
  File _image;
  List _recognitions;
  String diseaseName = "";
  bool _busy = false;

  Future _showDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Select image source"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text("Gallery"),
                    onTap: () {
                      predictImagePickerGallery(context);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  GestureDetector(
                    child: Text("Camera"),
                    onTap: () {
                      predictImagePickerCamera(context);
                    },
                  )
                ],
              ),
            ),
          );
        });
  }

  Future<void> predictImagePickerGallery(BuildContext context) async {
    final _picker = ImagePicker();
    var image = await _picker.getImage(source: ImageSource.gallery);
    if (image == null) return;
    setState(() {
      _busy = true;
      _image = image;
    });
    Navigator.of(context).pop();
    recognizeImage(image);
  }

  Future<void> predictImagePickerCamera(BuildContext context) async {
    final _picker = ImagePicker();
    var image = await _picker.getImage(source: ImageSource.camera);
    if (image == null) return;
    setState(() {
      _busy = true;
      _image = image as File;
    });
    Navigator.of(context).pop();
    recognizeImage(image);
  }

  final disease = {
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

  @override
  void initState() {
    super.initState();

    _busy = true;

    loadModel().then((val) {
      setState(() {
        _busy = false;
      });
    });
  }

  Future loadModel() async {
    try {
      await Tflite.loadModel(
        model: "assets/model_unquant.tflite",
        labels: "assets/labels.txt",
      );
    } on PlatformException {
      print('Failed to load model.');
    }
  }

  Future recognizeImage(PickedFile image) async {
    var recognitions = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 6,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _busy = false;
      _recognitions = recognitions;
    });
  }

  handleCure() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => Cure(diseaseName),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Widget> stackChildren = [];

    stackChildren.add(Positioned(
      top: 0.0,
      left: 0.0,
      width: size.width,
      child: _image == null
          ? Container(
              height: size.height - 50,
              child: Center(
                child: ElevatedButton(
                    onPressed: () {
                      _showDialog(context);
                    },
                    child: Text("Add Image")),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.file(
                _image,
                height: MediaQuery.of(context).size.height / 2,
                fit: BoxFit.cover,
              ),
            ),
    ));

    stackChildren.add(Positioned(
      top: MediaQuery.of(context).size.height / 2 + 20,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
          children: _recognitions != null
              ? _recognitions.map((res) {
                  diseaseName = res['label'];
                  return Text(
                    "Disease Name : ${res["label"]}",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold
                        // background: Paint()..color = Colors.white,
                        ),
                  );
                }).toList()
              : [],
        ),
      ),
    ));

    if (_image != null) {
      stackChildren.add(
        Positioned(
          right: 0,
          left: 0,
          top: MediaQuery.of(context).size.height / 1.80,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Cure : ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(disease[diseaseName]),
              ],
            ),
          ),
        ),
      );
    }

    if (_busy) {
      stackChildren.add(const Opacity(
        child: ModalBarrier(dismissible: false, color: Colors.grey),
        opacity: 0.3,
      ));
      stackChildren.add(const Center(child: CircularProgressIndicator()));
    }

    return Stack(
      children: stackChildren,
    );
  }
}
