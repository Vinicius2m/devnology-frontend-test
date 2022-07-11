import 'package:ecommerce_default/pages/cart_page.dart';
import 'package:ecommerce_default/pages/dashboard_page.dart';
import 'package:ecommerce_default/pages/login_page.dart';
import 'package:ecommerce_default/pages/register_page.dart';
import 'package:ecommerce_default/pages/splash_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromRGBO(38, 174, 96, 1),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Color.fromRGBO(38, 174, 96, 1)),
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (_) => const SplashPage(),
        '/register': (_) => const RegisterPage(),
        '/login': (_) => const LoginPage(),
        '/dashboard': (_) => const DashboardPage(),
        '/cart': (_) => const CartPage(),
      },
      home: const LoginPage(),
    );
  }
}
