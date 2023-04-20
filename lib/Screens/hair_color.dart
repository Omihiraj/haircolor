import 'package:cute_n_cuts/widgets/colors.dart';
import 'package:flutter/material.dart';
import '../widgets/horizontal_scroll_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HairColor extends StatefulWidget {
  const HairColor({Key? key}) : super(key: key);

  @override
  State<HairColor> createState() => _HairColorState();
}

class _HairColorState extends State<HairColor> {
  final db = FirebaseFirestore.instance;
  List<dynamic> results = List.empty();

  void getData(String color) {
    final docRef = db.collection("Hair_Color").doc(color);
    docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        setState(() {
          results = doc["hair_color"];
        });
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }

  @override
  Widget build(BuildContext context) {
    String tone = "";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        title: const Text('CUTE N CUTS'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top -
                  MediaQuery.of(context).padding.bottom -
                  kToolbarHeight,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.05,
                      left: MediaQuery.of(context).size.width * 0.03,
                      right: MediaQuery.of(context).size.width * 0.03),
                  child: const Text(
                    "To find the suitable hair color, first select your skin tone",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.03,
                  ),
                  child: HorizontalScrollView(
                    height: 150,
                    padding: 16,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          tone = "Fair";
                          getData(tone);
                          setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                        ),
                        child: Image.asset('assets/images/skin_tone1.png',
                            scale: 1),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          tone = "Dark";
                          print(tone);
                          getData(tone);
                          setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                        ),
                        child: Image.asset('assets/images/skin_tone2.png'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          tone = "Fair";
                          getData(tone);
                          setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                        ),
                        child: Image.asset('assets/images/skin_tone3.png'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          tone = "Fair";
                          getData(tone);
                          setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                        ),
                        child: Image.asset('assets/images/skin_tone4.png'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          tone = "Fair";
                          getData(tone);
                          setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                        ),
                        child: Image.asset('assets/images/skin_tone5.png'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          tone = "Fair";
                          getData(tone);
                          setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                        ),
                        child: Image.asset('assets/images/skin_tone6.png'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          tone = "Fair";
                          getData(tone);
                          setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                        ),
                        child: Image.asset('assets/images/skin_tone7.png'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          tone = "Fair";
                          getData(tone);
                          setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                        ),
                        child: Image.asset('assets/images/skin_tone8.png'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          tone = "Fair";
                          getData(tone);
                          setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                        ),
                        child: Image.asset('assets/images/skin_tone9.png'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          tone = "Fair";
                          getData(tone);
                          setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                        ),
                        child: Image.asset('assets/images/skin_tone10.png'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          tone = "Fair";
                          getData(tone);
                          setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                        ),
                        child: Image.asset('assets/images/skin_tone11.png'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          tone = "Fair";
                          getData(tone);
                          setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                        ),
                        child: Image.asset('assets/images/skin_tone12.png'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.8,
                  color: const Color.fromARGB(92, 167, 27, 73),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: results.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(results[index]),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
