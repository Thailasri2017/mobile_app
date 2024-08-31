import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:mobileapp/signup.dart';

import 'accountregisterpage.dart';

class Otppage extends StatefulWidget {
  const Otppage({super.key});

  @override
  State<Otppage> createState() => _OtppageState();
}

class _OtppageState extends State<Otppage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.push(context,MaterialPageRoute(builder: (context) =>Page1()));
        }, icon: Icon(Icons.arrow_back_ios_new)),
      ),
      body: Column(
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: width * 0.03,vertical: height * 0.02 ),
              child: Text('Verfication code sent to your mobile number',
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.purple.shade300),),
            ),
            OtpTextField(
              numberOfFields: 6,
              borderColor: Colors.purple,
              showFieldAsBox: true,
              onCodeChanged: (String code) {
                },
              onSubmit: (String verificationCode){
                showDialog(
                    context: context,
                    builder: (context){
                      return AlertDialog(
                        title: Text("Verification Code"),
                        content: Text('Code entered is $verificationCode'),
                      );
                    }
                );
              }, // end onSubmit
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: ElevatedButton(onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) =>AccountregisterPage()));
              }, child: Text('Submit',
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.purple),)),
            )
          ]
      ),
    );
  }
}
