import 'package:ecommerce_default/controllers/cart_controller.dart';
import 'package:ecommerce_default/models/product_model.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    CartController cartController =
        ModalRoute.of(context)!.settings.arguments as CartController;

    cartController.getCartProducts();

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Carrinho',
          ),
          actions: <Widget>[
            IconButton(
                iconSize: 25,
                onPressed: () {},
                icon: const Icon(Icons.logout_rounded))
          ],
        ),
        bottomNavigationBar: ValueListenableBuilder<List<ProductModel>>(
          valueListenable: cartController.cartProducts,
          builder: (_, cartProducts, __) => Container(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(38, 174, 96, 1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  flex: 0,
                  child: Text(
                    'Total: R\$ ${cartController.cartProducts.value.fold(0, (num previous, product) => previous + double.parse(product.price))}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.white,
                  ),
                  child: const Text(
                    'Finalizar',
                    style: TextStyle(
                      color: Color.fromARGB(255, 48, 240, 147),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 238, 238, 238),
        body: ValueListenableBuilder<List<ProductModel>>(
          valueListenable: cartController.cartProducts,
          builder: (context, cartProducts, _) => cartProducts.isNotEmpty
              ? ListView.builder(
                  itemCount: cartController.cartProducts.value.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: Container(
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(
                                cartController.cartProducts.value[index].image,
                              ),
                              // fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        title:
                            Text(cartController.cartProducts.value[index].name),
                        subtitle: Text(
                            'R\$ ${cartController.cartProducts.value[index].price}'),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () async {
                            setState(() {
                              cartController.removeFromCart(
                                  cartController.cartProducts.value[index]);
                            });
                          },
                        ),
                      ),
                    );
                  },
                )
              : const Center(
                  child: Text('Não há produtos no carrinho'),
                ),
        ));
  }
}
