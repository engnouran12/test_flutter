import 'dart:math';


class MockAuthService {
  final Map<String, String> _users = {
    "test@test.com": "123456",
  };
  String _token = '';

  String get token => _token;

  String _generateMockToken(String email) {
    // Simple token generator (just for mock purposes)
    print('✅ Token Generation Success');
    _token = "mock_token_${email.hashCode}_${Random().nextInt(9999)}";
    print('🔹 Token Generated: $_token');
    return _token;
  }
  Future<String?> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 1)); // Simulate network delay
    if (_users.containsKey(email) && _users[email] == password) {
      print('✅ Login Success');

      String newToken = _generateMockToken(email); // ✅ Generate token here
      print('🔹 Token After Login: $newToken');

      return newToken; // ✅ Return the new token
    }
    print('❌ Login Failed');
    return null;
  }


}
