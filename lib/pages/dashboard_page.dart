import 'dart:math';

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
        automaticallyImplyLeading: false,
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
          return products.isNotEmpty
              ? ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 20),
                      height: 280,
                      width: 200,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black45,
                            blurRadius: 10.0,
                            spreadRadius: 1.0,
                            offset: Offset(
                              2.0,
                              5.0,
                            ),
                          ),
                        ],
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 150.0,
                            // width: 130.0,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  topRight: Radius.circular(5)),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  products[index].image,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Container(
                                    alignment: Alignment.topLeft,
                                    margin: const EdgeInsets.only(
                                        top: 13, left: 13, right: 10),
                                    child: Text(
                                      products[index].name,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    top: 15,
                                    child: MaterialButton(
                                      height: 45,
                                      onPressed: () {},
                                      shape: const CircleBorder(),
                                      color:
                                          const Color.fromRGBO(38, 174, 96, 1),
                                      textColor: Colors.white,
                                      // padding: const EdgeInsets.all(16),
                                      child: const Icon(
                                          Icons.add_shopping_cart_rounded,
                                          size: 20),
                                    ),
                                  ),
                                ],
                              )),
                            ],
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: const EdgeInsets.only(
                                top: 8, left: 13, right: 10),
                            child: Text(
                              'R\$ ${products[index].price}',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w300),
                            ),
                          ),
                          Container(
                            height: 50,
                            alignment: Alignment.topLeft,
                            margin: const EdgeInsets.only(
                                top: 8, left: 13, right: 10),
                            child: Text(
                              products[index].description,
                              overflow: TextOverflow.clip,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
              : const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Color.fromARGB(255, 136, 255, 188),
                    color: Color.fromRGBO(38, 174, 96, 1),
                    strokeWidth: 2,
                  ),
                );
        },
      ),
    );
  }
}
