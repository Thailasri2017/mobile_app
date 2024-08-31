import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/signup.dart';
import "package:mobileapp/homepage.dart";
import 'package:mobileapp/selectedhome.dart';
import 'package:mobileapp/reviewhomepage.dart';
import 'package:mobileapp/orderplacementpage.dart';
import 'package:mobileapp/orderconfirmationpage.dart';
import 'package:mobileapp/splashscreenpage.dart';
import 'package:page_transition/page_transition.dart';



void main(){
  runApp(const MainPage());
}
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home:Splashscreenpage(),
   );
  }
}
