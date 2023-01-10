import 'package:auth_app/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: MyLogin());
    // home: AnimatedSplashScreen(
    //     duration: 3000,
    //     splash: Icons.qr_code_2_rounded,
    //     nextScreen: HomeScreen(),
    //     splashTransition: SplashTransition.sizeTransition,
    //     backgroundColor: Color.fromARGB(255, 162, 130, 238)));
  }
}
