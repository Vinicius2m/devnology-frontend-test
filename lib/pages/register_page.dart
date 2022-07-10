import 'package:ecommerce_default/components/logo_appbar_component.dart';
import 'package:ecommerce_default/components/register/register_body.component.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(45.0),
        child: LogoAppBar(),
      ),
      body: RegisterBodyWidget(),
      backgroundColor: Color.fromARGB(255, 238, 238, 238),
    );
  }
}
