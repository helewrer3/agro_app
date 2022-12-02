import 'dart:io';

import 'package:agro_app/meta/constants.dart';
import 'package:agro_app/meta/global_vars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class DiseaseScreen extends StatefulWidget {
  const DiseaseScreen({Key? key}) : super(key: key);

  @override
  State<DiseaseScreen> createState() => _DiseaseScreenState();
}

class _DiseaseScreenState extends State<DiseaseScreen> {
  late File? _image = null;
  late List? _recognitions = null;
  String _diseaseName = "";
  bool _busy = false;

  @override
  void initState() {
    super.initState();

    _busy = true;

    _loadModel().then((val) {
      setState(() {
        _busy = false;
      });
    });
  }

  Future _loadModel() async {
    try {
      await Tflite.loadModel(
        model: "assets/model_unquant.tflite",
        labels: "assets/label.txt",
      );
    } on PlatformException {
      print(ERROR);
    }
  }

  Future _recognizeImage(File image) async {
    List? recognitions = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 38,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    print(recognitions);
    setState(() {
      _busy = false;
      _recognitions = recognitions;
    });
  }

  Future<void> _predictImagePickerCamera(BuildContext context) async {
    XFile? tempImage =
        (await ImagePicker().pickImage(source: ImageSource.camera, maxWidth: 256, maxHeight: 256));
    if (tempImage == null) {
      return;
    } else {
      setState(() {
        _busy = true;
        _image = File(tempImage.path);
      });
      Navigator.of(context).pop();
      _recognizeImage(File(tempImage.path));
    }
  }

  Future<void> _predictImagePickerGallery(BuildContext context) async {
    XFile? tempImage =
        (await ImagePicker().pickImage(source: ImageSource.gallery, maxWidth: 256, maxHeight: 256));
    if (tempImage == null) {
      return;
    } else {
      setState(() {
        _busy = true;
        _image = File(tempImage.path);
      });
      Navigator.of(context).pop();
      _recognizeImage(File(tempImage.path));
    }
  }

  Future _showDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(SELECT_IMAGE_SOURCE),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                      child: const Text(GALLERY),
                      onTap: () => _predictImagePickerGallery(context)),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  GestureDetector(
                      child: const Text(CAMERA),
                      onTap: () => _predictImagePickerCamera(context))
                ],
              ),
            ),
          );
        });
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
          ? SizedBox(
              height: size.height - 50,
              child: Center(
                child: ElevatedButton(
                    onPressed: () {
                      _showDialog(context);
                    },
                    child: const Text("Add Image")),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.file(
                _image!,
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
              ? _recognitions!.map((res) {
                  _diseaseName = res['label'];
                  return Text(
                    "Disease Name : \n${res["label"]}",
                    style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  );
                }).toList().sublist(0, 1)
              : [],
        ),
      ),
    ));

    // if (_image != null) {
    //   stackChildren.add(Positioned(
    //     right: 0,
    //     left: 0,
    //     top: MediaQuery.of(context).size.height / 1.80,
    //     child: Padding(
    //         padding: const EdgeInsets.all(10),
    //         child: Text("Cure\n${demoDiseases[_diseaseName]}")),
    //   ));
    // }

    if (_busy) {
      stackChildren.add(const Opacity(
        opacity: 0.3,
        child: ModalBarrier(dismissible: false, color: Colors.grey),
      ));
      stackChildren.add(const Center(child: CircularProgressIndicator()));
    }

    return Stack(
      children: stackChildren,
    );
  }
}
