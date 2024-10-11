import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_task/features/product/presentation/bloc/product_event.dart';
import 'package:products_task/features/product/presentation/bloc/product_states.dart';
import '../../data/data_source/local.dart';
import '../../data/models/product_model.dart';
import '../../data/repository/product_repository.dart';

class ProductBloc extends Bloc<ProductEvent, ProductStates> {
  final ProductRepository productRepo;
  final LocalDataSource localDataSource;

  ProductBloc(this.productRepo, this.localDataSource)
      : super(ProductInitialState()) {
    on<FetchProductEvent>(onFetchProduct);
    on<ProductUpdatedEvent>(listenRealTimeUpdates);
  }

  Future<void> onFetchProduct(
      FetchProductEvent event, Emitter<ProductStates> emit) async {
    emit(ProductLoadingState());
    try {
      final List<ProductModel> products = await productRepo.fetchProducts();

      await localDataSource.storeProducts(products);

      emit(ProductLoadedState(products: products));
    } catch (e) {
      List<ProductModel> localProducts = await localDataSource.getProducts();

      if (localProducts.isNotEmpty) {
        emit(ProductLoadedState(products: localProducts));
      } else {
        emit(
            ProductErrorState(errorMessage: "No internet and no cached data."));
      }
      emit(
        ProductErrorState(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  void listenRealTimeUpdates(
      ProductUpdatedEvent event, Emitter<ProductStates> emit) {
    productRepo.getStreamPrice().listen(
      (products) {
        emit(ProductLoadedState(products: products));
      },
      onError: (error) {
        emit(ProductErrorState(errorMessage: error.toString()));
      },
    );
  }
}
