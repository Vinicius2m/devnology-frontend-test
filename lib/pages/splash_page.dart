import 'package:ecommerce_default/services/prefs_service.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.wait(
            [PrefsService.isAuth(), Future.delayed(const Duration(seconds: 2))])
        .then((value) => value[0]
            ? Navigator.pushReplacementNamed(context, '/dashboard')
            : Navigator.pushReplacementNamed(context, '/login'));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(211, 38, 190, 117),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.center, children: const [
        SizedBox(height: 25),
        CircularProgressIndicator(
          strokeWidth: 2,
          color: Colors.white60,
        )
      ]),
    );
  }
}
