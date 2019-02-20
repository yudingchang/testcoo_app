import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  static final Storage _instance = new Storage.internal();
  static SharedPreferences _prefs;

  factory Storage() {
    return _instance;
  }
  Storage.internal();

  Future<SharedPreferences> get prefs async {
    if(_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
    }
    return _prefs;
  }

  Future<String> getToken() async {
    var prefsClient = await prefs;
    return prefsClient.get('api_token');
  }

  void setToken(token) async {
    var prefsClient = await prefs;
    await prefsClient.setString('api_token', token);
  }
}
