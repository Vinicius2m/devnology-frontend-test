import 'package:ecommerce_default/controllers/dashboard_controller.dart';
import 'package:ecommerce_default/repositories/dashboard_repository_imp.dart';
import 'package:flutter/material.dart';

import '../models/product_model.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final DashboardController _dashboardController =
      DashboardController(DashboardRepositoryImp());

  @override
  void initState() {
    super.initState();
    _dashboardController.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Produtos',
        ),
        actions: <Widget>[
          IconButton(
              iconSize: 25,
              onPressed: () {},
              icon: const Icon(Icons.logout_rounded))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.shopping_cart_rounded),
        onPressed: () {},
      ),
      body: ValueListenableBuilder<List<ProductModel>>(
        valueListenable: _dashboardController.products,
        builder: (context, products, child) {
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(8),
                height: 280,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        top: 10.0,
                      ),
                      height: 130.0,
                      width: 130.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            products[index].image,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
