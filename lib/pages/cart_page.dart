import 'package:ecommerce_default/controllers/cart_controller.dart';
import 'package:ecommerce_default/models/product_model.dart';
import 'package:ecommerce_default/services/prefs_service.dart';
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
                onPressed: () {
                  PrefsService.logout().then((_) {
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil('/login', (_) => true);
                  });
                },
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
            height: 60,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    flex: 0,
                    child: Text(
                      'Total:\nR\$ ${cartController.cartProducts.value.fold(0, (num previous, product) => previous + double.parse(product.price))}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.all(13),
                    ),
                    child: const Text(
                      'Finalizar Compra',
                      style: TextStyle(
                        color: Color.fromARGB(255, 43, 214, 131),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () async {
                      var isDone = await cartController.checkoutCart();
                      if (isDone) {
                        showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                                  title: const Text('Sucesso!'),
                                  content: const Text(
                                      'Compra finalizada com sucesso'),
                                  actions: <Widget>[
                                    TextButton(
                                      style: ButtonStyle(
                                          foregroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.white),
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  const Color.fromRGBO(
                                                      38, 147, 96, 1))),
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, '/dashboard');
                                      },
                                      child: const Text('Ok'),
                                    )
                                  ],
                                ));
                      } else {
                        showDialog(
                            context: context,
                            builder: (_) => const AlertDialog(
                                  title: Text('Erro!'),
                                  content: Text(
                                      'Não foi possível finalizar a compra'),
                                ));
                      }
                    },
                  )
                ],
              ),
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
                            cartController.removeFromCart(
                                cartController.cartProducts.value[index]);
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
