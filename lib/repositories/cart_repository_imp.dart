import 'dart:convert';

import 'package:ecommerce_default/models/product_model.dart';
import 'package:ecommerce_default/repositories/cart_repository.dart';
import 'package:ecommerce_default/services/prefs_service.dart';
import 'package:http/http.dart' as http;

class CartRepositoryImp implements CartRepository {
  @override
  Future<bool> addToCart(ProductModel product) async {
    var client = http.Client();

    try {
      var token = await PrefsService.getToken();

      var response = await client.post(
          Uri.parse('https://api-ecommerce-default.herokuapp.com/cart'),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token'
          },
          body: jsonEncode(product.toJson()));
      if (response.statusCode == 201) {
        var json = jsonDecode(response.body);
        String productId =
            json['products'][json['products'].length - 1]['product_id'];
        product.productId = productId;
        return true;
      } else {
        return false;
      }
    } finally {
      client.close();
    }
  }

  @override
  Future<dynamic> removeFromCart(ProductModel product) async {
    var client = http.Client();

    try {
      var token = await PrefsService.getToken();

      var response = await client.delete(
        Uri.parse(
            'https://api-ecommerce-default.herokuapp.com/cart/${product.productId}'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        },
      );

      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        var products = json['products']
            .map<ProductModel>((item) => ProductModel.fromJson('normal', item))
            .toList();
        return products;
      } else {
        return false;
      }
    } finally {
      client.close();
    }
  }

  @override
  Future<List<ProductModel>> getCartProducts() async {
    var client = http.Client();

    try {
      var token = await PrefsService.getToken();

      var response = await client.get(
        Uri.parse('https://api-ecommerce-default.herokuapp.com/users'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        },
      );
      var json = jsonDecode(response.body);
      var products = json['cart']['products']
          .map<ProductModel>((item) => ProductModel.fromJson('normal', item))
          .toList();
      return products;
    } finally {
      client.close();
    }
  }

  @override
  checkoutCart() async {
    var client = http.Client();

    try {
      var token = await PrefsService.getToken();
      var response = await client.post(
        Uri.parse('https://api-ecommerce-default.herokuapp.com/cart/checkout'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        },
      );
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } finally {
      client.close();
    }
  }
}
