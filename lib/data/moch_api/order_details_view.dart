import '../models/order_details_model.dart';
import '../models/order_model.dart';

class OrderDetailsService {
  Order ?order;

  Future<OrderDetails> fetchOrderDetails(String orderId, ) async {
    await Future.delayed(Duration(seconds: 3)); // Simulate network delay

    return OrderDetails(
      orderId: orderId,
      clientName: "John Doe",
      address: "123 Main St, NY",
      items: "Laptop, Phone, Headphones",
      status: order?.status??'cancelled',
    );
  }
}
