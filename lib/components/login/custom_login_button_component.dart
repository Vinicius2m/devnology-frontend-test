import 'package:ecommerce_default/controllers/login_controller.dart';
import 'package:flutter/material.dart';

class CustomLoginButtonWidget extends StatelessWidget {
  final LoginController loginController;
  const CustomLoginButtonWidget({Key? key, required this.loginController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: loginController.isLoading,
        builder: (_, isLoading, __) => isLoading
            ? ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(const Size(400, 50)),
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromRGBO(38, 174, 96, 1))),
                child: const CircularProgressIndicator(
                  backgroundColor: Colors.white54,
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
            : ElevatedButton(
                onPressed: () {
                  loginController.login().then((value) {
                    if (value is List) {
                      Navigator.of(context).pushReplacementNamed('/dashboard');
                    } else {
                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                                title: const Text('Erro ao logar'),
                                content: Text('$value'),
                              ));
                    }
                  });
                },
                style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(const Size(400, 50)),
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromRGBO(38, 174, 96, 1))),
                child: const Text('Login'),
              ));
  }
}
