import 'package:ecommerce_default/components/login/login_body_component.dart';
import 'package:ecommerce_default/components/logo_appbar_component.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(45.0),
        child: LogoAppBar(),
      ),
      body: LoginBody(),
      backgroundColor: Color.fromARGB(255, 238, 238, 238),
    );
  }
}
