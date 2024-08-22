import 'package:flutter/material.dart';
import 'package:mobileapp/page7.dart';

class Page24 extends StatefulWidget {
  const Page24({super.key});

  @override
  State<Page24> createState() => _Page24State();
}

class _Page24State extends State<Page24> {
  String? _selectedPaymentMethod;
  final List<String> _paymentMethods = ['Cash on Delivery', 'Pay Online'];
  String _selectedPriceDetail = 'Total Product Price';
  final List<String> _priceDetailsOptions = ['Total Product Price', 'Order Total'];
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _promoCodeController = TextEditingController();
  String _additionalNotes = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_sharp),
        ),
        title: Text(
          'Payment Method',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(color: Colors.grey),
            Expanded(
              child: ListView(
                children: [
                  ..._paymentMethods.map((method) {
                    return ListTile(
                      title: Text(method),
                      leading: Radio<String>(
                        value: method,
                        groupValue: _selectedPaymentMethod,
                        onChanged: (value) {
                          setState(() {
                            _selectedPaymentMethod = value;
                          });
                        },
                      ),
                    );
                  }).toList(),
                  TextField(
                    controller: _addressController,
                    decoration: InputDecoration(
                      hintText: 'Enter your delivery address',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Contact Information :',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: TextField(
                      controller: _contactController,
                      decoration: InputDecoration(
                        hintText: 'Enter your contact number',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Reselling the order?',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Divider(color: Colors.grey),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Price Details (1 Item)',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      DropdownButton<String>(
                        value: _selectedPriceDetail,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedPriceDetail = newValue!;
                          });
                        },
                        items: _priceDetailsOptions.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Text(
                      'Promo Code (Optional)',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextField(
                    controller: _promoCodeController,
                    decoration: InputDecoration(
                      hintText: 'Enter promo code',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Additional Notes',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: TextField(
                      onChanged: (text) {
                        setState(() {
                          _additionalNotes = text;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Add any special instructions',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 3,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '₹350',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Page7()));
                        },
                        child: Text(
                          'Place Order',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'View Price Details',
                        style: TextStyle(fontSize: 18, color: Colors.purple, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
