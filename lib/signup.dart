import 'package:flutter/material.dart';
import 'package:mobileapp/login.dart';

import 'accountregisterpage.dart';
import 'otppage.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal:width * 0.03,vertical: height * 0.02 ),
          child: IconButton(onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (context) =>Page2()));
          },
              icon: Icon(Icons.arrow_back)),
        ),
        title:
      Padding(
        padding: const EdgeInsets.only(top: 15.0,right: 10,left: 10),
        child: Text('MEESHO',
          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,
          color: Colors.purple),),

      ), 
        actions: [Padding(
          padding: const EdgeInsets.only(top: 20.0,right: 10),
          child: TextButton(onPressed: (){}, child: Text('Login',
            style: TextStyle(fontWeight: FontWeight.bold,color: Colors.purple.shade300,fontSize: 16),)),
        )],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 1,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0,right: 20),
              child: Text('Enter your Mobile number for Verification',style: TextStyle(
                fontWeight: FontWeight.bold,fontSize: 18,color: Colors.purple.shade300),),
            ),
            Form(
              key: _formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left:20,top: 20),
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: 220,
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Mobile number',border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20,left: 10,right: 170),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple.shade300),onPressed: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context) =>Otppage()));
                      }, child: Text('Send OTP',
                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),)),
                    ),
                  ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}
