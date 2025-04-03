import 'dart:async';

class OrderDetails {
  final String orderId;
  final String clientName;
  final String address;
  final String items;
  String status;

  OrderDetails({
    required this.orderId,
    required this.clientName,
    required this.address,
    required this.items,
    required this.status,
  });
}

