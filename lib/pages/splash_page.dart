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
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacementNamed('/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(211, 38, 190, 117),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.center, children: const [
        SizedBox(height: 25),
        CircularProgressIndicator(
          color: Colors.white60,
        )
      ]),
    );
  }
}
