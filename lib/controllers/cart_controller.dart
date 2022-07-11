import 'package:ecommerce_default/models/product_model.dart';
import 'package:flutter/widgets.dart';

import '../repositories/cart_repository.dart';

class CartController {
  final CartRepository _cartRepository;

  CartController(this._cartRepository);

  ValueNotifier<List<ProductModel>> cartProducts =
      ValueNotifier<List<ProductModel>>([]);

  Future<bool> addToCart(ProductModel product) async {
    var isAdded = await _cartRepository.addToCart(product);

    if (isAdded) {
      cartProducts.value = await _cartRepository.getCartProducts();
      return true;
    }
    return false;
  }

  getCartProducts() async {
    List<ProductModel> products = await _cartRepository.getCartProducts();

    cartProducts.value = products;
  }

  removeFromCart(ProductModel product) async {
    _cartRepository.removeFromCart(product).then((value) {
      if (value != false) {
        cartProducts.value = value;
        return true;
      }
      return value;
    });
  }
}
