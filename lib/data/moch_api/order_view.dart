import 'dart:async';

import '../models/order_model.dart';


class OrderService {
  Future<List<Order>> fetchOrders() async {
    await Future.delayed(Duration(seconds: 3)); // Simulate network delay

    return [
      Order(clientName: "John Doe", address: "123 Main St, NY", status: "Cancelled",),
      Order(clientName: "Alice Smith", address: "45 High St, LA", status: "Cancelled"),
      Order(clientName: "Bob Johnson", address: "78 Elm St, SF", status: "Delivered"),
      Order(clientName: "Eve Brown", address: "90 Oak St, DC", status: "Delivered"),
      Order(clientName: "Charlie Davis", address: "12 Pine St, NY", status: "Delivered"),
      Order(clientName: "Grace Wilson", address: "34 Cedar St, LA", status: "Delivered"),
      Order(clientName: "Frank Thompson", address: "56 Maple St, SF", status: "Delivered"),
    ];
  }
}
