import 'package:flutter/material.dart';
import '../widgets/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Result extends StatefulWidget {
  const Result({Key? key, required this.shape}) : super(key: key);
  final String shape;
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  int _selectedOption = 0;

  final db = FirebaseFirestore.instance;

  final List<String> _options = [
    'Between 16 - 25',
    'Between 25 - 35',
    'Between 35 - 50',
    'Between 50 - 65',
    'Above 65',
  ];

  List<dynamic> results = List.empty();

  showAlertDialog(BuildContext context, List? hairCuts) {
    // Create button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    Widget setupAlertDialoadContainer() {
      return SizedBox(
        height: 300.0, // Change as per your requirement
        width: 300.0, // Change as per your requirement
        child: hairCuts == null
            ? const Center(child: Text("No Hair Cuts Found"))
            : ListView.builder(
                shrinkWrap: true,
                itemCount: hairCuts.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(hairCuts[index]),
                  );
                },
              ),
      );
    }

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Suggested Hair cuts"),
      content: setupAlertDialoadContainer(),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Haircut'),
        backgroundColor: MyColors.primaryColor,
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Select Your Age Range:',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 20),
                Column(
                  children: _options
                      .asMap()
                      .entries
                      .map((entry) => RadioListTile(
                            title: Text(entry.value),
                            value: entry.key,
                            groupValue: _selectedOption,
                            onChanged: (int? value) {
                              setState(() {
                                _selectedOption = value!;
                              });
                            },
                          ))
                      .toList(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: MaterialButton(
                    color: const Color.fromARGB(157, 224, 66, 114),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    onPressed: () {
                      final docRef =
                          db.collection("Hair_Cuts").doc(widget.shape);
                      docRef.get().then(
                        (DocumentSnapshot doc) {
                          final data = doc.data() as Map<String, dynamic>;

                          setState(() {
                            if (data[_options[_selectedOption]] == null) {
                              showAlertDialog(context, null);
                            } else {
                              results = data[_options[_selectedOption]];
                              showAlertDialog(context, results);
                            }

                            print(results);
                          });

                          //print(data[_options[_selectedOption]]);
                        },
                        onError: (e) => print("Error getting document: $e"),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Text(
                        "Generate results",
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
        ),
      ),
    );
  }
}
