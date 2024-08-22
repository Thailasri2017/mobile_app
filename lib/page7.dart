import 'package:flutter/material.dart';
import 'ordermodelclass.dart';

class Page7 extends StatelessWidget {
  final OrderDetails? orderDetails;

  Page7({Key? key, this.orderDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final order = orderDetails;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios_new_sharp),
        ),
        title: Text(
          'Order Confirmation',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Column(
                  children: [
                    Text('Thank You for Your Order!',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Your order has been successfully placed.',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Divider(color: Colors.grey),
              SizedBox(height: 16),
              // Order Summary
              Text('Order Summary',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
                ListTile(
                  leading: Image.asset('assets/images/designer-silk-saree.jpg', width: 60, height: 60),
                  title: Text(order?.itemName ?? 'Soft Silk Saree'),
                  subtitle: Text('Quantity: ${order?.quantity ?? 1 }'),
                  trailing: Text('₹${order?.itemPrice?.toStringAsFixed(2) ?? '827'}',
                    style: TextStyle(fontSize: 16),),
                ),
               SizedBox(height: 20),
              // Price Breakdown
              Text(
                'Price Breakdown',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Subtotal: ₹${order?.subtotal?.toStringAsFixed(2) ?? '827'}',
                style: TextStyle(fontSize: 16),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Text(
                  'Shipping Fee: ₹${order?.shippingFee?.toStringAsFixed(2) ?? '100'}',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Text(
                  'Tax: ₹${order?.tax?.toStringAsFixed(2) ?? '20'}',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Text(
                  'Total Amount: ₹${order?.totalAmount?.toStringAsFixed(2) ?? '947'}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
                ),
              ),
              SizedBox(height: 20),
              // Shipping Information
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  'Shipping Information',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Shipping Address: ${order?.shippingAddress ?? '16, New street Madipakkam, Chennai, Tamilnadu-600091'}'
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  'Estimated Delivery Date: ${order?.deliveryDate ?? 'Expected delivery by Wednesday'}',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  'Shipping Method: ${order?.shippingMethod ?? 'Standard Shipping'}'
                ),
              ),
              SizedBox(height: 20),
              // Payment Details
              Text(
                'Payment Details',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Text(
                'Payment Method: ${order?.paymentMethod ?? 'Cash on delivery'}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  'Billing Address: ${order?.billingAddress ?? '16, New street Madipakkam, Chennai, Tamilnadu-600091'}',
                ),
              ),
              SizedBox(height: 16),
              // Action Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 50),
                    child: TextButton(
                      onPressed: () {
                        // Handle Track My Order action
                      },
                      child: Text(
                        'Track My Order',
                        style: TextStyle(fontSize: 16, color: Colors.blue),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle View Order History action
                    },
                    child: Text(
                      'View Order History',
                      style: TextStyle(fontSize: 16, color: Colors.blue),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  // Handle Need Help? Contact Us action
                },
                child: Text(
                  'Need Help? Contact Us',
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
