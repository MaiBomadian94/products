import 'package:products_task/features/product/data/models/product_model.dart';

abstract class ProductStates {}

class ProductInitialState extends ProductStates {}

class ProductLoadingState extends ProductStates {}

class ProductLoadedState extends ProductStates {
  final List<ProductModel> products;

  ProductLoadedState({required this.products});
}

class ProductErrorState extends ProductStates {
  final String? errorMessage;

  ProductErrorState({required this.errorMessage});
}
