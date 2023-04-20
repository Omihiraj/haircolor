import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.43,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(216, 126, 180, 0.839),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 196, 140, 158),
                    blurRadius: 15.0,
                    spreadRadius: 5.0,
                    offset: Offset(
                      5.0,
                      5.0,
                    ),
                  )
                ],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(250),
                  bottomRight: Radius.circular(250),
                ),
              ),
              child: Image.asset("assets/images/haircut.png"),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  ' Helping You to,',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Select Best Haircut & Most Suitable Hair color for you',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: MaterialButton(
                color: const Color.fromARGB(157, 224, 66, 114),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/second');
                },
                child: const Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Text(
                    "GET STARTED",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
