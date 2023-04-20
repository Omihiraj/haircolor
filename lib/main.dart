import 'package:cute_n_cuts/Screens/login.dart';
import 'package:cute_n_cuts/Screens/signup.dart';
import 'package:flutter/material.dart';
import 'Screens/bottom_navigation_bar.dart';
import 'Screens/check_email.dart';
import 'Screens/create_password.dart';
import 'Screens/forgot_password.dart';
import 'Screens/home.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/eight',
      routes: {
        //'/': (context) => const Result(),
        '/second': (context) => const Login(),
        '/third': (context) => const SignupScreen(),
        '/fourth': (context) => const ForgotPassword(),
        '/fifth': (context) => const CreatePassword(),
        '/sixth': (context) => const CheckEmail(),
        '/seventh': (context) => const BottomNavBar(),
        '/eight': (context) => const Home(),
      },
    );
  }
}
