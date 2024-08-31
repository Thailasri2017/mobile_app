// // import 'package:flutter/material.dart';
// // import 'dart:async';
// //
// // import 'package:mobileapp/signup.dart';
// //
// // class SplashScreen extends StatefulWidget {
// //   @override
// //   _SplashScreenState createState() => _SplashScreenState();
// // }
// //
// // class _SplashScreenState extends State<SplashScreen> {
// //   @override
// //   void initState() {
// //     super.initState();
// //     Timer(Duration(seconds: 3), () {
// //       Navigator.of(context).pushReplacement(
// //         MaterialPageRoute(builder: (context) => Page1()),
// //       );
// //     });
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       body: Center(
// //         child: Image.asset('lib/images/mayura.png'),
// //       ),
// //     );
// //   }
// // }
//
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/login.dart';
import 'package:mobileapp/signup.dart';

class Splashscreenpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Text('Meesho',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,
          color: Colors.deepPurple.shade800),),
      nextScreen: Page2(),
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: Colors.purple.shade200,
    );
  }
}
