import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
 static late SharedPreferences _prefs;

  // Initialize SharedPreferences
static  Future<void> init() async {
    try {
      _prefs = await SharedPreferences.getInstance();
    } catch (e) {
      debugPrint('Error initializing SharedPreferences: $e');
      rethrow;
    }
  }

  // Save token to cache
static  Future<void> saveToken(String token) async {
    await _prefs.setString('auth_token', token);
  }

  // Retrieve token from cache
 static String? getToken() {
    final token = _prefs.getString('auth_token');
    debugPrint('Token retrieved from cache: $token');
    return token;
  }

  // Remove token from cache
 static Future<void> clearToken() async {
    await _prefs.remove('auth_token');
  }







}
