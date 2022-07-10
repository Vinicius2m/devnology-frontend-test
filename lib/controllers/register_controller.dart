import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterController {
  final ValueNotifier<bool> isLoading = ValueNotifier(false);

  String? _name;
  setName(String value) => _name = value;

  String? _cpf;
  setCpf(String value) => _cpf = value;

  String? _email;
  setEmail(String value) => _email = value;

  String? _password;
  setPassword(String value) => _password = value;

  String? _confirmPassword;
  setConfirmPassword(String value) => _confirmPassword = value;

  Map toJson() {
    return {
      'name': _name,
      'cpf': _cpf,
      'email': _email,
      'password': _password,
    };
  }

  verifyCredentials() {
    if (_name == null ||
        _cpf == null ||
        _email == null ||
        _password == null ||
        _confirmPassword == null) {
      return 'Preencha todos os campos';
    }
    if (_password != _confirmPassword) {
      return 'As senhas não conferem';
    }
    if (_password!.length < 6) {
      return 'A senha deve ter no mínimo 6 caracteres';
    }
    if (_password!.length > 20) {
      return 'A senha deve ter no máximo 20 caracteres';
    }
    if (!_email!.contains('@')) {
      return 'Preencha um email válido';
    }
    if (!_email!.contains('.')) {
      return 'Preencha um email válido';
    }
    if (_cpf!.length < 11) {
      return 'O CPF deve ter no mínimo 11 caracteres';
    }
    if (_cpf!.length > 11) {
      return 'O CPF deve ter no máximo 11 caracteres';
    }
    return true;
  }

  Future register() async {
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
                'https://api-ecommerce-default.herokuapp.com/users/register'),
            body: toJson());
        if (response.statusCode == 400) {
          isLoading.value = false;
          return 'Erro ao cadastrar usuário';
        }
        if (response.statusCode == 409) {
          isLoading.value = false;
          return 'Email ou CPF já cadastrado';
        }
        if (response.statusCode == 201) {
          isLoading.value = false;
          return true;
        }
      }
    } finally {
      client.close();
    }
  }
}
