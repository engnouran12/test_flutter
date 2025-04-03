import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../data/models/order_details_model.dart';
import '../../../../data/models/order_model.dart';
import '../../../controller/order_details_provider.dart';
import '../../order_details_feature/widgets/order_details_screen.dart';

class OrderCard extends StatelessWidget {
  final Order order;
  final OrderDetails orderdetails;

  const OrderCard({required this.order, required this.orderdetails});

  @override
  Widget build(BuildContext context) {

    return Card(
      elevation: 3,
      margin: EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Client: ${order.clientName}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text("Address: ${order.address}", style: TextStyle(fontSize: 16)),
            SizedBox(height: 5),
            Text("Status: ${orderdetails.status}", style: TextStyle(fontSize: 16, color: Colors.blue)),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ChangeNotifierProvider
      (
        create: (_) => OrderDetailsProvider(),
        child: OrderDetailsScreen(orderId: "123",status: order.status,))), // Pass order ID
    );
                },

                child: Text("View Details", style: TextStyle(color: Colors.blue)),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
