import 'package:flutter/material.dart';

import '../../data/models/order_details_model.dart';
import '../../data/repositories/remote_repo/order_details_repo.dart';

class OrderDetailsProvider with ChangeNotifier {
  final OrderDetailsRepository _repository = OrderDetailsRepository();
  OrderDetails? _orderDetails;
  bool _isLoading = true;
  String? _errorMessage;

  OrderDetails? get orderDetails => _orderDetails;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  OrderDetailsProvider(){
    fetchOrderDetails("1",'cancelled');
  }

  Future<void> fetchOrderDetails(String orderId,String status) async {
    _isLoading = true;
    notifyListeners();

    try {
      _orderDetails = await _repository.getOrderDetails(orderId,status);
      _isLoading=false;
      notifyListeners();
      _errorMessage = null;
    } catch (e) {
      _errorMessage = "Failed to fetch order details.";
      _isLoading=false;
    }

    _isLoading = false;
    notifyListeners();
  }

  void updateOrderStatus(String newStatus) {
    if (_orderDetails != null) {
      _orderDetails!.status = newStatus;
      notifyListeners();
    }
  }
}
