import 'dart:convert';

import 'package:ecommerce_default/models/product_model.dart';
import 'package:ecommerce_default/repositories/dashboard_repository.dart';
import 'package:http/http.dart' as http;

class DashboardRepositoryImp implements DashboardRepository {
  @override
  Future<List<ProductModel>> getList() async {
    var client = http.Client();

    try {
      var responseSupp1 = await client.get(Uri.parse(
          'http://616d6bdb6dacbb001794ca17.mockapi.io/devnology/brazilian_provider'));
      var jsonSupp1 = jsonDecode(responseSupp1.body);
      var listProductsFromSupp1 = jsonSupp1
          .map<ProductModel>((item) => ProductModel.fromJson('supplier1', item))
          .toList();

      var responseSupp2 = await client.get(Uri.parse(
          'http://616d6bdb6dacbb001794ca17.mockapi.io/devnology/european_provider'));
      var jsonSupp2 = jsonDecode(responseSupp2.body);
      var listProductsFromSupp2 = jsonSupp2
          .map<ProductModel>((item) => ProductModel.fromJson('supplier2', item))
          .toList();

      return listProductsFromSupp1 + listProductsFromSupp2;
    } finally {
      client.close();
    }
  }
}
