import 'package:flutter/material.dart';
import 'package:mobileapp/page2.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Text('Mayura shopping app',
          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,
          color: Colors.pinkAccent),),

      ), 
        actions: [Padding(
          padding: const EdgeInsets.only(top: 20.0,right: 10),
          child: TextButton(onPressed: (){}, child: Text('Login')),
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
              padding: const EdgeInsets.only(top: 25.0,right: 130),
              child: Text('Create supplier account',style: TextStyle(
                fontWeight: FontWeight.bold,fontSize: 20,),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0,left: 10,right: 120,bottom: 30),
              child: Text('Sell your products to crores of buyers'),
            ),
            Form(
              key: _formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left:20),
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: 220,
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Mobile number',border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Container(
                              height: 40,
                              width: 130,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue),
                                  onPressed: (){}, child: Text('Send OTP',
                                style:TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold),)),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15,left: 20,right: 20),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Enter OTP',border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            labelText: 'Email',border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.grey)
                        )),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter valid email address';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                            suffixIcon: Icon(Icons.remove_red_eye_rounded),
                            labelText: 'Set Password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.grey)
                            )
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please set your password';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15,right: 80),
                      child: Text('Make your password strong by adding :',
                        style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold)
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30,top: 10,left: 20),
                      child: Text('Minimum 8 characters(letters,Special characters & numbers)',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue),onPressed: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context) =>Page2()));
                      }, child: Text('Next',
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
