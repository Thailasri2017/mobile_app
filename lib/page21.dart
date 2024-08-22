import 'package:flutter/material.dart';
import 'package:mobileapp/page28.dart';
import 'package:mobileapp/page4.dart';
import 'package:mobileapp/page6.dart';

class Page21 extends StatefulWidget {
  const Page21({super.key,});

  @override
  State<Page21> createState() => _Page21State();
}

class _Page21State extends State<Page21> {
  final List<String> gridImages = [
    'lib/images/jewells.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {Navigator.pop(context);},
          icon: Icon(Icons.arrow_back_ios_new_sharp),
        ),
        title: Text(
          'Review your order',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search_rounded),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(color: Colors.grey),
            Text('Estimated Delivery by Sunday, 31st August',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 30),
            Center(
              child: Image.asset('lib/images/jewells.jpg',
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8),
            Center(
              child: Column(
                children: [
                  Text('Jewellery Sets', style: TextStyle(fontSize: 16)),
                  Text( '₹370', style: TextStyle(fontSize: 16)),
                  Text('Size: Free size. Qty: 1', style: TextStyle(fontSize: 14)),
                ],
              ),
            ),
            SizedBox(height: 16),
            Divider(color: Colors.grey),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.location_on),
                SizedBox(width: 8),
                Text('Delivery Address',style: TextStyle(fontWeight: FontWeight.bold),),
                Spacer(),
                TextButton(onPressed: () {},
                  child: Text('Change',style: TextStyle(fontSize: 16),),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Thailasri S', style: TextStyle(fontSize: 16)),
                  Text('16, New Street Madipakkam, Chennai, Tamilnadu, 600091',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Divider(color: Colors.grey),
            SizedBox(height: 16),
            Text('Price Details (1 Item)',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Text('Total Product Price: ₹370',
                style: TextStyle(fontSize: 14),
              ),
            ),
            SizedBox(height: 16),
            Divider(color: Colors.grey),
            SizedBox(height: 16),

            // Order Total
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Order Total: ₹370',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Page28()),
                    );
                  },
                  child: Text('Continue',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 16),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('₹370',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('View Price Details',
                    style: TextStyle(fontSize: 16, color: Colors.purple),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
