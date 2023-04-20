import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(131, 129, 40, 70),
        automaticallyImplyLeading: false,
      ),
      resizeToAvoidBottomInset: true,
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
                const SizedBox(height: 8),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.06,
                    ),
                    child: Image.asset(
                      "assets/images/cuten.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
               Padding(
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.05),
                  child: const Text(
                    "Forgot Your Password?",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
               const SizedBox(height: 5),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.width * 0.15,
                  ),
                  child: const Text(
                    " Enter your registered email below to receive password reset instruction",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
               
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.05, right: MediaQuery.of(context).size.width * 0.05,
                    bottom: MediaQuery.of(context).size.width * 0.15,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1F1F1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 8,
                      ),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
          
                        ),
                      ),
                    ),
                  ),
                ),
                
               SizedBox(height: MediaQuery.of(context).size.height * 0.00),
               Row(
                children: [
                  Expanded(
                    child: Padding(
                       padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05),
                      child: MaterialButton(
                        color: const Color.fromARGB(157, 224, 66, 114),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/second');
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(
                            "SEND",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: MediaQuery.of(context).size.width * 0.05,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                 Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                          Navigator.pushNamed(context, '/third');  
                      },
                      child:  Text(
                        "Back to Login",
                        style:
                            TextStyle(color: const Color.fromARGB(157, 224, 66, 114),
                            fontSize: MediaQuery.of(context).size.width * 0.04,),
                  
                      )),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
          ],
        ),
      ),
        ),
      ),
    );
  }
}