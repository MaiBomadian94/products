import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:products_task/features/product/data/models/product_model.dart';

class ProductServiceRemote {
  final String apiUrl = 'https://fakestoreapi.com/products';

  Future<List<ProductModel>> fetchProducts() async {
    final response = await http.get(Uri.parse(apiUrl));

    try {
      if (response.statusCode == 200) {

        final List<dynamic>data = json.decode(response.body);

        return data.map((json) => ProductModel.fromJson(json)).toList();
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
