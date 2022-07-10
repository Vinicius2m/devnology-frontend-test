import 'package:ecommerce_default/controllers/register_controller.dart';
import 'package:flutter/material.dart';

class RegisterFieldsWidget extends StatelessWidget {
  const RegisterFieldsWidget({Key? key, required this.registerController})
      : super(
          key: key,
        );

  final RegisterController registerController;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text(
        'Cadastro',
        style: TextStyle(
            color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold),
      ),
      const SizedBox(
        height: 15,
      ),
      TextFormField(
        onChanged: registerController.setName,
        decoration: InputDecoration(
          focusColor: Colors.black87,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          labelText: 'Nome',
          labelStyle: const TextStyle(
            color: Color.fromARGB(255, 196, 196, 196),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 2,
              color: Color.fromRGBO(38, 174, 96, 1),
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 2,
              color: Colors.black87,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
      const SizedBox(
        height: 25,
      ),
      TextFormField(
        onChanged: registerController.setCpf,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          labelText: 'CPF (Somente números)',
          labelStyle: const TextStyle(
            color: Color.fromARGB(255, 196, 196, 196),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 2,
              color: Color.fromRGBO(38, 174, 96, 1),
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 2,
              color: Colors.black87,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
      const SizedBox(
        height: 25,
      ),
      TextFormField(
        onChanged: registerController.setEmail,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          labelText: 'Email',
          labelStyle: const TextStyle(
            color: Color.fromARGB(255, 196, 196, 196),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 2,
              color: Color.fromRGBO(38, 174, 96, 1),
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 2,
              color: Colors.black87,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
      const SizedBox(
        height: 25,
      ),
      TextFormField(
        onChanged: registerController.setPassword,
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          labelText: 'Senha (Conter minúscula, maiúscula, número)',
          labelStyle: const TextStyle(
            color: Color.fromARGB(255, 196, 196, 196),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 2,
              color: Color.fromRGBO(38, 174, 96, 1),
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 2,
              color: Colors.black87,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
      const SizedBox(
        height: 25,
      ),
      TextFormField(
        onChanged: registerController.setConfirmPassword,
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          labelText: 'Confirmar senha',
          labelStyle: const TextStyle(
            color: Color.fromARGB(255, 196, 196, 196),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 2,
              color: Color.fromRGBO(38, 174, 96, 1),
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 2,
              color: Colors.black87,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      )
    ]);
  }
}
