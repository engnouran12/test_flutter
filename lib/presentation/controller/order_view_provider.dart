import 'package:flutter/material.dart';

import '../../data/models/order_model.dart';
import '../../data/repositories/remote_repo/order_repo.dart';

class OrderProvider with ChangeNotifier {
  final OrderRepository _repository = OrderRepository();
  List<Order> _orders = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Order> get orders => _orders;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  OrderProvider() {
    fetchOrders(); // Fetch orders when provider is created
  }


  Future<void> fetchOrders() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _orders = await _repository.getOrders();

      _errorMessage = null;
      notifyListeners();
    } catch (e) {
      _errorMessage = "Failed to fetch orders.";
    }

    _isLoading = false;
    notifyListeners();
  }
}
