import 'dart:io';

import 'package:cute_n_cuts/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

import 'image_screen.dart';

class MyHaircut extends StatefulWidget {
  const MyHaircut({Key? key}) : super(key: key);

  @override
  _MyHaircutState createState() => _MyHaircutState();
}

class _MyHaircutState extends State<MyHaircut> {
  File? _image; // To store the captured image

  Future<void> _openCamera(BuildContext context) async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image!.path);
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ImageScreen(image: _image!),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CUTE N CUTS'),
        backgroundColor: MyColors.primaryColor,
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top -
                MediaQuery.of(context).padding.bottom -
                kToolbarHeight,
          ),
          child: Column(
            children: [
              const SizedBox(height: 9),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05,
                    left: MediaQuery.of(context).size.width * 0.06,
                    right: MediaQuery.of(context).size.width * 0.03),
                child: const Text(
                  "To find the best haircut, first find your face shape",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.06,
                  right: MediaQuery.of(context).size.width * 0.06,
                ),
                child: Container(
                  color: Colors.grey[200],
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () => _openCamera(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[200],
                          ),
                          child: Image.asset(
                            'assets/images/camera.png',
                            height: MediaQuery.of(context).size.height * 0.13,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          '[ Open the camera ]',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 12),
                        Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.06,
                            right: MediaQuery.of(context).size.width * 0.06,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 60),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.06,
                    right: MediaQuery.of(context).size.width * 0.03),
                child: const Text(
                  'Note:  To choose the right haircut for you, please take a frontal photo that clearly shows your face.',
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
