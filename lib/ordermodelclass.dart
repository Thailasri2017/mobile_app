class OrderDetails {
  final String itemName;
  final int quantity;
  final double itemPrice;
  final double subtotal;
  final double shippingFee;
  final double tax;
  final double totalAmount;
  final String shippingAddress;
  final String deliveryDate;
  final String shippingMethod;
  final String paymentMethod;
  final String billingAddress;

  OrderDetails({
    required this.itemName,
    required this.quantity,
    required this.itemPrice,
    required this.subtotal,
    required this.shippingFee,
    required this.tax,
    required this.totalAmount,
    required this.shippingAddress,
    required this.deliveryDate,
    required this.shippingMethod,
    required this.paymentMethod,
    required this.billingAddress,
  });
}
