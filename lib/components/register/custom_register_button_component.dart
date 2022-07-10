import 'package:ecommerce_default/controllers/register_controller.dart';
import 'package:flutter/material.dart';

class CustomRegisterButtonWidget extends StatelessWidget {
  final RegisterController registerController;
  const CustomRegisterButtonWidget({Key? key, required this.registerController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: registerController.isLoading,
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
                  registerController.register().then((value) {
                    if (value == true) {
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (_) => AlertDialog(
                                title: const Text('Sucesso!'),
                                content: const Text(
                                    'Cadastro realizado com sucesso!'),
                                actions: <Widget>[
                                  TextButton(
                                    style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.all(
                                                Colors.white),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                const Color.fromRGBO(
                                                    38, 147, 96, 1))),
                                    onPressed: () {
                                      Navigator.pushReplacementNamed(
                                          context, '/login');
                                    },
                                    child: const Text('Ok'),
                                  )
                                ],
                              ));
                    } else {
                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                                title: const Text('Erro ao cadastrar'),
                                content: Text('$value'),
                              ));
                    }
                  });
                },
                style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(const Size(400, 50)),
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromRGBO(38, 174, 96, 1))),
                child: const Text('Cadastrar'),
              ));
  }
}
