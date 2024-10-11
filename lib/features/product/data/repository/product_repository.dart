import 'package:products_task/features/product/data/models/product_model.dart';

import '../data_source/local.dart';
import '../data_source/remote.dart';

class ProductRepository {
  final ProductServiceRemote service;

  final LocalDataSource localDataSource;

  ProductRepository(this.service, this.localDataSource);

  Future<List<ProductModel>> fetchProducts() async {
    try {
      List<ProductModel> products = await service.fetchProducts();

      await localDataSource.storeProducts(products);
      return products;
    } catch (e) {
      return await localDataSource.getProducts();
    }
  }

  Stream<List<ProductModel>> getStreamPrice() {
    return localDataSource.getRealTimePrice();
  }
}
