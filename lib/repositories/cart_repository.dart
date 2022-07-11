import 'package:ecommerce_default/models/product_model.dart';

abstract class CartRepository {
  Future<bool> addToCart(ProductModel product);

  getCartProducts();

  Future<dynamic> removeFromCart(ProductModel product);
}
