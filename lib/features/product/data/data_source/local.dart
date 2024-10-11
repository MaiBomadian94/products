import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:products_task/features/product/data/models/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSource {
  static const String cacheKey = 'cached_products';

  // store products in shared preferences use set List

  Future<void> storeProducts(List<ProductModel> products) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> jsonProducts =
        products.map((product) => json.encode(product.toJson())).toList();

    await prefs.setStringList(cacheKey, jsonProducts);
  }

  // get products from shared preferences use get List

  Future<List<ProductModel>> getProducts() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String>? jsonProducts = prefs.getStringList(cacheKey);

    if (jsonProducts != null) {
      return jsonProducts
          .map((jsonProduct) => ProductModel.fromJson(json.decode(jsonProduct)))
          .toList();
    } else {
      return [];
    }
  }

  final DatabaseReference _databaseReference =
      FirebaseDatabase.instance.ref('products');

  Stream<List<ProductModel>> getRealTimePrice() {
    return _databaseReference.onValue.map((event) {
      if (event.snapshot.value == null) {
        return [];
      } else {
        List<ProductModel> productList = [];
        final data = Map<String, dynamic>.from(event.snapshot.value as Map);

        data.forEach((key, value) {
          productList
              .add(ProductModel.fromJson(Map<String, dynamic>.from(value)));
        });

        return productList;
      }
    });
  }
}
