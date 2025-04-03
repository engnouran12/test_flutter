
import '../../moch_api/order_details_view.dart';
import '../../models/order_details_model.dart';

class OrderDetailsRepository {
  final OrderDetailsService _service = OrderDetailsService();

  Future<OrderDetails> getOrderDetails(String orderId,String status) async {
    return _service.fetchOrderDetails(orderId);
  }
}
