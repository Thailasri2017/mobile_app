import 'package:flutter/material.dart';
import 'package:mobileapp/page1.dart';
import "package:mobileapp/page3.dart";
import 'package:mobileapp/page4.dart';
import 'package:mobileapp/page5.dart';
import 'package:mobileapp/page6.dart';
import 'package:mobileapp/page7.dart';
import 'package:mobileapp/splashscreenpage.dart';



void main(){
  runApp(Mainpage());
}
class Mainpage extends StatelessWidget {
  const Mainpage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
