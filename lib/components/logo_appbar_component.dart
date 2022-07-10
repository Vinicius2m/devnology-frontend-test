import 'package:flutter/material.dart';

class LogoAppBar extends StatelessWidget {
  const LogoAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: const <Widget>[
              Text(
                'Devnology',
                style: TextStyle(
                    color: Color.fromARGB(255, 48, 240, 147),
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
