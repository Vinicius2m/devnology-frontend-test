import 'package:ecommerce_default/models/product_model.dart';
import 'package:ecommerce_default/repositories/dashboard_repository.dart';
import 'package:flutter/widgets.dart';

class DashboardController {
  final DashboardRepository _dashboardRepository;

  DashboardController(this._dashboardRepository);

  ValueNotifier<List<ProductModel>> products =
      ValueNotifier<List<ProductModel>>([]);

  fetch() async {
    products.value = await _dashboardRepository.getList();
  }
}
