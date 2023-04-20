import 'dart:io';

import 'package:cute_n_cuts/Screens/result.dart';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';

import '../widgets/colors.dart';

class ImageScreen extends StatefulWidget {
  final File image;

  const ImageScreen({Key? key, required this.image}) : super(key: key);

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  String modeledFaceShape = "";

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/model/model_unquant.tflite",
      labels: "assets/model/labels.txt",
    );
  }

  runModel() async {
    var recognitions = await Tflite.runModelOnImage(
      path: widget.image.path, // required
    );

    double maxConfidence = 0;
    String faceShape = "";
    for (int i = 0; i < recognitions!.length; i++) {
      double confidence = recognitions[i]["confidence"];
      if (maxConfidence < confidence) {
        maxConfidence = confidence;
        faceShape = recognitions[i]["label"];
      }
    }

    print("Face Shape : ${faceShape.substring(2)}");
    setState(() {
      modeledFaceShape = faceShape.substring(2);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadModel();
  }

  @override
  Widget build(BuildContext context) {
    String result = "";
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Haircut'),
        backgroundColor: MyColors.primaryColor,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white10,
                      width: 3,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  height: MediaQuery.of(context).size.width * 0.7,
                  child: Image.file(widget.image),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: MaterialButton(
                color: const Color.fromARGB(157, 224, 66, 114),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                onPressed: () {
                  runModel();
                },
                child: const Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Text(
                    "Find My Face Shape",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.18,
                color: const Color.fromARGB(92, 167, 27, 73),
                child: Center(
                  child: Text(
                    modeledFaceShape,
                    style: const TextStyle(color: Colors.white, fontSize: 32),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: MaterialButton(
                color: const Color.fromARGB(157, 224, 66, 114),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Result(shape: modeledFaceShape),
                      ));
                },
                child: const Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Text(
                    "Next",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
