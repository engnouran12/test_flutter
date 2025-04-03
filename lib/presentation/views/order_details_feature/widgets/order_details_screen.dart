import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/order_details_provider.dart';

class OrderDetailsScreen extends StatelessWidget {
  final String orderId;
final String status;
  const OrderDetailsScreen({required this.orderId, required this.status});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Order Details")),
      body: Consumer<OrderDetailsProvider>(
        builder: (context, orderProvider, child) {
          if (orderProvider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (orderProvider.errorMessage != null) {
            return Center(child: Text(orderProvider.errorMessage!));
          }

          final order = orderProvider.orderDetails!;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Client: ${order.clientName}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                Text("Address: ${order.address}", style: TextStyle(fontSize: 16)),
                SizedBox(height: 5),
                Text("Items: ${order.items}", style: TextStyle(fontSize: 16)),
                SizedBox(height: 5),
                Text("Status: ${order.status}", style: TextStyle(fontSize: 16, color: Colors.blue)),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        orderProvider.updateOrderStatus("Delivered");
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                      child: Text("Mark as Delivered"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        orderProvider.updateOrderStatus("Cancelled");
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      child: Text("Cancel Order"),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
