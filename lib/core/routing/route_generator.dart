import 'package:flutter/material.dart';
import 'package:products_task/features/product/data/models/product_model.dart';
import 'package:products_task/features/product/presentation/product_detail_view.dart';
import '../../features/product/presentation/product_list_view.dart';
import 'app_router.dart';

class RoutesGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteName.home:
        return MaterialPageRoute(
          builder: (context) => const ProductListView(),
          settings: settings,
        );

      case AppRouteName.productDetails:
        final ProductModel product = settings.arguments as ProductModel;
        return MaterialPageRoute(
          builder: (context) => ProductDetailView(productModel: product),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const ProductListView(),
          settings: settings,
        );
    }
  }
}
