import 'dart:convert';

import 'package:ecommerce_default/controllers/login_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsService {
  static const String _key = 'key';

  static save(String token) async {
    await SharedPreferences.getInstance().then((prefs) {
      prefs.setString(_key, jsonEncode({'token': token, 'isAuth': true}));
    });
  }

  static Future<bool> isAuth() async {
    var prefs = await SharedPreferences.getInstance();

    var jsonResult = prefs.getString(_key);
    if (jsonResult != null) {
      var mapToken = json.decode(jsonResult);
      if (await LoginController.verifyToken(mapToken['token'])) {
        return true;
      } else {
        await prefs.remove(_key);
        return false;
      }
    }
    return false;
  }

  static Future<String> getToken() async {
    var prefs = await SharedPreferences.getInstance();

    var jsonResult = prefs.getString(_key);
    if (jsonResult != null) {
      var mapToken = json.decode(jsonResult);
      return mapToken['token'];
    }
    return '';
  }

  static Future<void> logout() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}
