import 'dart:math';

import 'package:test/data/moch_api/auth_moch_api.dart';

class AuthService{
  MockAuthService _mockAuthService=MockAuthService();
  Future<String?>login(String email,String password)async{
    return await _mockAuthService.login(email, password);

  }

}