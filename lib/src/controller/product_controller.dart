import 'dart:convert';

import 'package:api_with_riverpod/src/models/product.dart';
import 'package:api_with_riverpod/src/repo/product_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:welltested_annotation/welltested_annotation.dart';

final productControllerProvider = Provider((ref){
  final productRepo = ref.watch(productRepoProvider);
  return ProductController(productRepo: productRepo);
});


@Welltested()
class ProductController {
  final ProductRepo _productRepo;

  ProductController({required ProductRepo productRepo}):_productRepo = productRepo;

  Future<List<Product>> getProducts() async {
    final response = await _productRepo.getProducts();
    final data = jsonDecode(response.body);
    List<Product> products = [];
    final productsJson = data['products'];

    for(dynamic productJson in productsJson){
      products.add(Product.fromJson(productJson));
    }
    return products;
  }
}