import 'package:ecommerce_default/controllers/cart_controller.dart';
import 'package:ecommerce_default/controllers/dashboard_controller.dart';
import 'package:ecommerce_default/repositories/cart_repository_imp.dart';
import 'package:ecommerce_default/repositories/dashboard_repository_imp.dart';
import 'package:ecommerce_default/services/prefs_service.dart';
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

  final CartController _cartController = CartController(CartRepositoryImp());

  ValueNotifier<bool> _isLoading = ValueNotifier<bool>(false);

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
              onPressed: () {
                PrefsService.logout().then((_) {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/login', (_) => true);
                });
              },
              icon: const Icon(Icons.logout_rounded))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.shopping_cart_rounded),
        onPressed: () async {
          Navigator.of(context).pushNamed('/cart', arguments: _cartController);
          await _cartController.getCartProducts();
        },
      ),
      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
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
                      padding: const EdgeInsets.only(bottom: 12),
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
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(left: 13),
                                  child: Text(
                                    overflow: TextOverflow.visible,
                                    textWidthBasis: TextWidthBasis.parent,
                                    products[index].name,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              ValueListenableBuilder<bool>(
                                  valueListenable: _isLoading,
                                  builder: (context, isLoading, child) {
                                    return isLoading
                                        ? MaterialButton(
                                            onPressed: () {},
                                            height: 45,
                                            clipBehavior: Clip.none,
                                            shape: const CircleBorder(),
                                            color: const Color.fromRGBO(
                                                38, 174, 96, 1),
                                            textColor: Colors.white,
                                            // padding: const EdgeInsets.all(16),
                                            child:
                                                const CircularProgressIndicator(
                                              strokeWidth: 2,
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                      Colors.white),
                                            ))
                                        : MaterialButton(
                                            height: 45,
                                            clipBehavior: Clip.none,
                                            shape: const CircleBorder(),
                                            color: const Color.fromRGBO(
                                                38, 174, 96, 1),
                                            textColor: Colors.white,
                                            // padding: const EdgeInsets.all(16),
                                            child: const Icon(
                                                Icons.add_shopping_cart_rounded,
                                                size: 20),
                                            onPressed: () async {
                                              _isLoading.value = true;
                                              if (await _cartController
                                                  .addToCart(products[index])) {
                                                _isLoading.value = false;
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                        const SnackBar(
                                                  content: Text(
                                                      'Produto adicionado ao carrinho'),
                                                  duration:
                                                      Duration(seconds: 1),
                                                ));
                                              } else {
                                                _isLoading.value = false;
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                        const SnackBar(
                                                  content: Text(
                                                      'Produto já está no carrinho'),
                                                  duration:
                                                      Duration(seconds: 1),
                                                ));
                                              }
                                            },
                                          );
                                  }),
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
