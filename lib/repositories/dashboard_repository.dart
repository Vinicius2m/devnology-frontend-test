import 'package:ecommerce_default/models/product_model.dart';

abstract class DashboardRepository {
  Future<List<ProductModel>> getList();
}
