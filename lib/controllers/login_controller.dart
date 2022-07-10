import 'dart:convert';

import 'package:ecommerce_default/services/prefs_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginController {
  final ValueNotifier<bool> isLoading = ValueNotifier(false);

  String? _email;
  setEmail(String value) => _email = value;

  String? _password;
  setPassword(String value) => _password = value;

  Map toJson() {
    return {
      'email': _email,
      'password': _password,
    };
  }

  verifyCredentials() {
    if (_email == null || _password == null) {
      return 'Preencha todos os campos';
    }
    if (!_email!.contains('@')) {
      return 'Preencha um email válido';
    }
    if (!_email!.contains('.')) {
      return 'Preencha um email válido';
    }
    return true;
  }

  Future login() async {
    var client = http.Client();
    isLoading.value = true;
    try {
      if (verifyCredentials() is String) {
        await Future.delayed(const Duration(milliseconds: 200));
        isLoading.value = false;
        return verifyCredentials();
      } else {
        var response = await client.post(
            Uri.parse(
                'https://api-ecommerce-default.herokuapp.com/users/login'),
            body: toJson());
        if (response.statusCode == 400) {
          isLoading.value = false;
          return 'Erro ao fazer login';
        }
        if (response.statusCode == 200) {
          isLoading.value = false;
          PrefsService.save(jsonDecode(response.body)['token']!);
          return [true, response.body];
        }
      }
    } finally {
      client.close();
    }
  }
}
