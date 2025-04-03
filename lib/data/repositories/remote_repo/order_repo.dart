
import '../../moch_api/order_view.dart';
import '../../models/order_model.dart';

class OrderRepository {
  final OrderService _service = OrderService();

  Future<List<Order>> getOrders() async {
    return _service.fetchOrders();
    print('orderrepo');
  }
}
