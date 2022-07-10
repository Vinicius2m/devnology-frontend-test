import 'package:ecommerce_default/components/register/custom_register_button_component.dart';
import 'package:ecommerce_default/components/register/register_fields_component.dart';
import 'package:ecommerce_default/controllers/register_controller.dart';
import 'package:flutter/material.dart';

class RegisterBodyWidget extends StatefulWidget {
  const RegisterBodyWidget({Key? key}) : super(key: key);

  @override
  State<RegisterBodyWidget> createState() => _RegisterBodyWidgetState();
}

class _RegisterBodyWidgetState extends State<RegisterBodyWidget> {
  final RegisterController _registerController = RegisterController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 15),
          child: Container(
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(
                  color: const Color.fromARGB(255, 221, 221, 221),
                  width: 2,
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RegisterFieldsWidget(registerController: _registerController),
                const SizedBox(
                  height: 25,
                ),
                Center(
                  child: CustomRegisterButtonWidget(
                    registerController: _registerController,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      } else {
                        Navigator.pushNamed(context, '/login');
                      }
                    },
                    style: ButtonStyle(
                        fixedSize:
                            MaterialStateProperty.all(const Size(400, 50)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.grey.shade600)),
                    child: const Text('Login'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
