
import 'package:flutter/material.dart';

import '../../data/repositories/local_repo/cashe_helper.dart';
import '../../data/repositories/remote_repo/auth_api.dart';
import 'package:provider/provider.dart';

import '../views/order_view_feature/order_screen.dart';
import 'order_view_provider.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();
  bool _isLoading = false;
  String? _errorMessage;
  String? _message ;
  String?_token;



  bool get isLoading => _isLoading;
String? get token=>_token;
  String? get errorMessage => _errorMessage;
  String? get message => _message;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
 void dispose(){
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  Future<void> login(String email, String password, BuildContext context) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    print("🔍 Attempting login...");

    String? receivedToken = await _authService.login(email, password);
    print("🛠 Token received in AuthProvider: $receivedToken");

    if (receivedToken != null && receivedToken.isNotEmpty) {
      _token = receivedToken; // ✅ Assign the token properly

      await CacheHelper.saveToken(_token!);
print('token after cash:$_token');
      _isLoading = false;
      _errorMessage = null;
      _message = "Login successful";
      notifyListeners();

      print("✅ Login successful, navigating...");

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(_message!)),
      );

      Future.microtask(() {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => OrderScreen(),
          ),
        );
      });
    } else {
      print("❌ Login failed! Token is null or empty.");
      _isLoading = false;
      _errorMessage = "Invalid email or password";
      notifyListeners();
    }
  }


}
