import 'dart:convert';

import 'package:api_with_riverpod/src/models/product.dart';
import 'package:api_with_riverpod/src/repo/product_repo.dart';

class ProductController {
  final productRepo = ProductRepo();

  Future<List<Product>> getProducts() async {
    final response = await productRepo.getProducts();
    final data = jsonDecode(response.body);
    List<Product> products = [];
    final productsJson = data['products'];

    for(dynamic productJson in productsJson){
      products.add(Product.fromJson(productJson));
    }
    return products;
  }
}