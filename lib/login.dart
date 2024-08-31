import 'package:flutter/material.dart';
import 'package:mobileapp/signup.dart';
import 'package:mobileapp/homepage.dart';
import 'package:http/http.dart' as http;

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();


  bool isLoading = false;

  Future<void> login(String email, String password) async {
    setState(() { isLoading = true;
    }
    );
    try {
      var response = await http.post(
        Uri.parse("https://reqres.in/api/register"),
        body: {
          "email": email,
          "password": password,
        },
      );
      setState(() {
        isLoading = false;
      });
      if (response.statusCode == 200) {
        print("Login successful");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Login successful: ${response.statusCode}"),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Login failed: ${response.statusCode}"),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Exception during login: $e"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(right:120,left: 10),
          child: Text(
            'MEESHO',
            style: TextStyle(fontSize: 20, color: Colors.purple,fontWeight: FontWeight.bold),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Page1()),
            );
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width * 0.05),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Please Login to continue',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.purple.shade300),
                ),
              ),
              SizedBox(height: 24),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.remove_red_eye_rounded),
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.purple.shade200
                    )
                  ),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgotten password?',
                    style: TextStyle(fontSize: 16, color: Colors.purple.shade200,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 14),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple.shade400,
                ),
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Page3()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Please fill in all required fields.'),
                      ),
                    );
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40,top: 30),
                child: Row(
                  children: [
                    Text('Do not have an account ?',style: TextStyle(
                      fontSize: 18,color: Colors.purple.shade300,fontWeight: FontWeight.bold
                    ),),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Page1()));
                    }, child: Text('Sign up',
                      style: TextStyle(color: Colors.purple.shade300,fontWeight: FontWeight.bold,
                      fontSize: 18),)),
                  ],
                ),
              )
            ],
          ),
         ),
      ),
    );
  }
}
