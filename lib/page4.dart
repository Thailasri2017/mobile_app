// import 'package:flutter/material.dart';
// import 'package:mobileapp/page3.dart';
// import 'package:mobileapp/page5.dart';
//
// class Page4 extends StatefulWidget {
//   const Page4({super.key, required this.index});
//
//   final int index;
//
//   @override
//   State<Page4> createState() => _Page4State();
// }
//
// class _Page4State extends State<Page4> {
//   final List<String> gridImages = [
//     'lib/images/Cosmetics.jpg',
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios_new),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => Page3()),
//               );
//             },
//             icon: Icon(Icons.search_rounded),
//           ),
//           IconButton(
//             onPressed: () {},
//             icon: Icon(Icons.favorite, color: Colors.red),
//           ),
//           IconButton(
//             onPressed: () {},
//             icon: Icon(Icons.shopping_cart, color: Colors.purple),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 10),
//                 child: Row(
//                   children: [
//                     Icon(Icons.location_on, color: Colors.blue),
//                     SizedBox(width: 8),
//                     Expanded(
//                       child: Text(
//                         'Add delivery location to get extra discount',
//                         style: TextStyle(fontSize: 16),
//                       ),
//                     ),
//                     Icon(Icons.navigate_next),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 20),
//               Container(
//                 width: double.infinity,
//                 child: Image.asset('lib/images/designer-silk-saree.jpg'),
//               ),
//               SizedBox(height: 10),
//               Text(
//                 'Silk Saree',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 10),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     '₹827',
//                     style: TextStyle(fontSize: 18),
//                   ),
//                   Row(
//                     children: [
//                       IconButton(
//                         onPressed: () {},
//                         icon: Icon(Icons.favorite_border),
//                       ),
//                       IconButton(
//                         onPressed: () {},
//                         icon: Icon(Icons.share_rounded),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               SizedBox(height: 10),
//               Text('Free Delivery',
//                 style: TextStyle(fontSize: 16),
//               ),
//               SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text('Select size',
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   ElevatedButton(style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.blue,
//                     ),
//                     onPressed: () {
//                       Navigator.push(context, MaterialPageRoute(builder: (context) => Page5()),
//                       );
//                     },
//                     child: Text('Buy Now',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:mobileapp/page3.dart';
import 'package:mobileapp/page5.dart';

class Page4 extends StatefulWidget {
  const Page4({super.key,});



  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  final List<String> gridImages = [
    'lib/images/designer-silk-saree.jpg',
  ];
  
  bool _isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Page3()),
              );
            },
            icon: Icon(Icons.search_rounded),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite, color: Colors.red),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart, color: Colors.purple),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.blue),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Add delivery location to get extra discount',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Icon(Icons.navigate_next),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                child: Image.asset('lib/images/designer-silk-saree.jpg'),
              ),
              SizedBox(height: 10),
              Text(
                'Silk Saree',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '₹827',
                    style: TextStyle(fontSize: 18),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _isFavorited = !_isFavorited;
                          });
                        },
                        icon: Icon(
                          _isFavorited ? Icons.favorite : Icons.favorite_border,
                          color: _isFavorited ? Colors.red : null,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.share_rounded),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text('Free Delivery',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Select size',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Page5()),
                      );
                    },
                    child: Text(
                      'Buy Now',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
