import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/dummy_api/homeapi.dart';
import 'package:mobileapp/model_class/hoemmodel.dart';
import 'package:mobileapp/page10.dart';
import 'package:mobileapp/page11.dart';
import 'package:mobileapp/page12.dart';
import 'package:mobileapp/page13.dart';
import 'package:mobileapp/page14.dart';
import 'package:mobileapp/page4.dart';
import 'package:mobileapp/page5.dart';
import 'package:mobileapp/page7.dart';
import 'package:mobileapp/page8.dart';
import 'package:mobileapp/page9.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

@override
State<Page3> createState() => _Page3State();

class _Page3State extends State<Page3> {
   late Map<String,dynamic> values;
  late HomeModel home;
  @override
  void initState() {
    values=HomeApi.values;
    home=HomeModel.fromjson(values);
    super.initState();
  }
  final List<String> Names = [
    'Mens wear',
    'Kids wear',
    'Women wear',
    'Foot wear',
    'Accesories',
    'Kitchen utensils',
    'Cosmetics',
    'Sports'
  ];
  final List<String> gridImages = [
    'lib/images/kurti.jpg',
    'lib/images/kids frock.jpg',
    'lib/images/designer-silk-saree.jpg',
    'lib/images/shoes images.jpg',
    'lib/images/perfume.png',
    'lib/images/lip shades.png',
    'lib/images/Kitchen utensils.jpg',
    'lib/images/jewells.jpg',
  ];
  final List<String> gridNames = [
    'Charvi Kurtis',
    'Fancy Girls frocks',
    'Kashvi Siksarees',
    'Casual Shoes',
    'Bella Perfumes',
    'Lipshades',
    'Kitchen utensils',
    'Jewellery Sets'
  ];

  int currentindex = 0;
  int _selectedIndex = 0;
  String selectedIndex= 'Sort';
  String selectedValue= 'Category';
  String selectedCategory = 'Gender';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan.shade300,
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.asset("lib/images/img.png",
            height: 20,
            width: 20,
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello,',
              style: TextStyle(fontSize: 15),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Text('Lets shop!',
                style: TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.favorite, color: Colors.red,),),
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart, color: Colors.purple,)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Container(
                height: 60,
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    hintText: 'Search by Keyword or Protect ID',
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.camera_alt), onPressed: () {},),
                        IconButton(icon: Icon(Icons.mic), onPressed: () {},),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Container(
                height: 40,
                color: Colors.grey.shade100,
                child: Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.blue),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child:
                            Text(home.location),
                      ),
                    ),
                    Icon(Icons.navigate_next),
                  ],
                ),
              ),
            ),
            Container(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: home.images.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 100,
                    margin: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(home.images[index]),
                          backgroundColor: Colors.grey[200],
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          Names[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              height: 170,
              width: 380,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: CarouselSlider(
                      items:home.images.map((imagePath) {
                        return Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(imagePath),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }).toList(),
                      options: CarouselOptions(
                        height: 200,
                        autoPlay: true,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        autoPlayAnimationDuration: Duration(seconds: 2),
                        autoPlayInterval: Duration(seconds: 3),
                        viewportFraction: 1.0,
                          enlargeCenterPage: true,
                        initialPage: currentindex,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentindex = index;
                          });
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: MediaQuery.of(context).size.width / 2 - 50,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: AnimatedSmoothIndicator(
                        activeIndex: currentindex,
                        count: home.images.length,
                        effect: WormEffect(
                            dotHeight: 6,
                            dotWidth: 8,
                            spacing: 7,
                            dotColor: Colors.white,
                            activeDotColor: Colors.lightBlue),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:10,bottom: 10),
              child: Row(
                children: [
                  DropdownButton<String>(style: TextStyle(fontWeight: FontWeight.bold,
                  color: Colors.black,fontSize: 14),borderRadius: BorderRadius.circular(10),
                    value: selectedValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedValue = newValue!;
                      });
                    },
                    items: <String>['Category','Women Watches','Kids-Girls frocks','Men watches','Hair Accessories',
                    'Kids Toys','Men Shirts','Women tops and jeans','Sarees'].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }
                    ).toList(),
                  ),
                  DropdownButton<String>(style: TextStyle(fontWeight: FontWeight.bold,
                      color: Colors.black,fontSize: 14),borderRadius: BorderRadius.circular(10),
                    value: selectedIndex,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedIndex = newValue!;
                      });
                    },
                    items: <String>['Sort', 'Relevance', 'New Arrivals', 'Price(High to low)','Price(low to high)',
                      'Ratings','Discount'].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }
                    ).toList(),
                  ),
                  DropdownButton<String>(style: TextStyle(fontWeight: FontWeight.bold,
                      color: Colors.black,fontSize: 14),borderRadius: BorderRadius.circular(10),
                    value: selectedCategory,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCategory = newValue!;
                      });
                    },
                    items: <String>['Gender','Women','Men','Girls','Boys'].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }
                    ).toList(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30, bottom: 20),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.greenAccent.shade100,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          child: Image.asset('lib/images/return.png'),
                        ),
                        Text('Easy returns & \n refunds',
                          style: TextStyle(fontSize: 15, color: Colors.deepPurple),
                        ),
                        CircleAvatar(child: Image.asset('lib/images/cod.png'),
                        ),
                        Text('Cash on\n delivery',
                          style: TextStyle(fontSize: 15, color: Colors.deepPurple),),
                        CircleAvatar(child: Image.asset('lib/images/Lowprice.png'),),
                        Text('Lowest\n price', style: TextStyle(fontSize: 15, color: Colors.deepPurple),),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, bottom: 10.0),
              child: Text('Products For You', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              primary: false,
              padding: EdgeInsets.all(8.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 0.8,
              ),
              itemCount: gridImages.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      switch(index){
                        case 0:Navigator.push(context, MaterialPageRoute(builder: (context) => Page8()),);
                        break;
                        case 1:Navigator.push(context, MaterialPageRoute(builder: (context) => Page9()),);
                        break;
                        case 2:Navigator.push(context, MaterialPageRoute(builder: (context) => Page4()),);
                        break;
                        case 3:Navigator.push(context, MaterialPageRoute(builder: (context) => Page10()),);
                        break;
                        case 4:Navigator.push(context, MaterialPageRoute(builder: (context) => Page11()),);
                        break;
                        case 5:Navigator.push(context, MaterialPageRoute(builder: (context) => Page12()),);
                        break;
                        case 6:Navigator.push(context, MaterialPageRoute(builder: (context) => Page13()),);
                        break;
                        case 7:Navigator.push(context, MaterialPageRoute(builder: (context) => Page14()),);
                        break;
                      }
                      //
                    },
                    child: Card(
                        elevation: 5.0,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: GestureDetector(
                                child: Image.asset(
                                  gridImages[index],
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              ),
                              ),
                              Container(
                                color: Colors.transparent,
                                child: Center(
                                  child: Text(gridNames[index]),
                                ),
                              )
                            ],
                        ),
                    ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: Colors.black,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined,color: Colors.black,),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mark_email_read,color: Colors.black,),
            label: 'Mail',
          ),
          BottomNavigationBarItem(
             icon: Icon(Icons.settings,color: Colors.black,),
             label: 'Settings',
          ),
  ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// class Page1 extends StatefulWidget {
//   const Page1({super.key});
//
//   @override
//   State<Page1> createState() => _Page1State();
// }
//
// class _Page1State extends State<Page1> {
//   final _formKey = GlobalKey<FormState>();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _mobileController = TextEditingController();
//   final _otpController = TextEditingController();
//
//   Future<void> _sendOtp() async {
//     final response = await http.post(
//       Uri.parse('http://localhost:3000/send-otp'),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(<String, String>{
//         'mobile': _mobileController.text,
//       }),
//     );
//
//     if (response.statusCode == 200) {
//       print('OTP sent');
//     } else {
//       print('Failed to send OTP');
//     }
//   }
//
//   Future<void> _verifyOtp() async {
//     final response = await http.post(
//       Uri.parse('http://localhost:3000/verify-otp'),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(<String, String>{
//         'mobile': _mobileController.text,
//         'otp': _otpController.text,
//       }),
//     );
//
//     if (response.statusCode == 200) {
//       print('OTP verified');
//     } else {
//       print('Invalid OTP');
//     }
//   }
//
//   Future<void> _register() async {
//     final response = await http.post(
//       Uri.parse('http://localhost:3000/register'),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(<String, String>{
//         'email': _emailController.text,
//         'password': _passwordController.text,
//       }),
//     );
//
//     if (response.statusCode == 201) {
//       print('User registered');
//     } else {
//       print('Registration failed');
//     }
//   }
//
//   Future<void> _login() async {
//     final response = await http.post(
//       Uri.parse('http://localhost:3000/login'),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(<String, String>{
//         'email': _emailController.text,
//         'password': _passwordController.text,
//       }),
//     );
//
//     if (response.statusCode == 200) {
//       print('Login successful');
//     } else {
//       print('Login failed');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Padding(
//           padding: const EdgeInsets.only(top: 15.0),
//           child: Text(
//             'Mayura shopping app',
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.pinkAccent),
//           ),
//         ),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(top: 20.0, right: 10),
//             child: TextButton(
//               onPressed: _login,
//               child: Text('Login'),
//             ),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               height: 1,
//               color: Colors.grey,
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 25.0, right: 130),
//               child: Text('Create supplier account', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 15.0, left: 10, right: 120, bottom: 30),
//               child: Text('Sell your products to crores of buyers'),
//             ),
//             Form(
//               key: _formKey,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.only(left: 20),
//                     child: Row(
//                       children: [
//                         Container(
//                           height: 50,
//                           width: 220,
//                           child: TextFormField(
//                             controller: _mobileController,
//                             decoration: InputDecoration(
//                               labelText: 'Mobile number',
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 10.0),
//                           child: Container(
//                             height: 40,
//                             width: 130,
//                             child: ElevatedButton(
//                               style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
//                               onPressed: _sendOtp,
//                               child: Text('Send OTP', style: TextStyle(fontSize: 12, color: Colors.white)),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
//                     child: TextFormField(
//                       controller: _otpController,
//                       decoration: InputDecoration(
//                         labelText: 'Enter OTP',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: TextFormField(
//                       controller: _emailController,
//                       decoration: InputDecoration(
//                         prefixIcon: Icon(Icons.person),
//                         labelText: 'Email',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20),
//                           borderSide: BorderSide(color: Colors.grey),
//                         ),
//                       ),
//                       keyboardType: TextInputType.emailAddress,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your email';
//                         }
//                         return null;
//                       },
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: TextFormField(
//                       controller: _passwordController,
//                       decoration: InputDecoration(
//                         suffixIcon: Icon(Icons.remove_red_eye_rounded),
//                         labelText: 'Set Password',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20),
//                           borderSide: BorderSide(color: Colors.grey),
//                         ),
//                       ),
//                       obscureText: true,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your password';
//                         }
//                         return null;
//                       },
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 15, right: 80),
//                     child: Text('Make your password strong by adding :', style: TextStyle(fontSize: 15)),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(right: 30, top: 10),
//                     child: Text('Minimum 8 characters(letters & numbers)', style: TextStyle(fontSize: 15)),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 20.0),
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
//                       onPressed: _register,
//                       child: Text('Next', style: TextStyle(color: Colors.white)),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
