import '../../data/models/product_model.dart';

abstract class ProductEvent {}

class FetchProductEvent extends ProductEvent {}

class ProductUpdatedEvent extends ProductEvent {

  final List<ProductModel> products;

  ProductUpdatedEvent(this.products);
}
