import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/presentation/controller/order_details_provider.dart';
import 'package:test/presentation/views/order_view_feature/widgets/ordercardWidget.dart';

import '../../controller/order_view_provider.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderProvider>(context);
   // final detailsorder=  Provider.of<OrderDetailsProvider>(context);


//print(ord)
    return Scaffold(
      appBar: AppBar(title: Text("Orders")),
      body: RefreshIndicator(
        onRefresh: orderProvider.fetchOrders,
        child: orderProvider.isLoading
            ? Center(child: CircularProgressIndicator())
            : orderProvider.errorMessage != null
            ? Center(child: Text(orderProvider.errorMessage!))
            : ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: orderProvider.orders.length,
          itemBuilder: (context, index) {
           // print(orderProvider.orders);
            return OrderCard(order: orderProvider.orders[index]
            );
          },
        ),
      ),
    );
  }
}
