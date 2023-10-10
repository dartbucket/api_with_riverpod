import 'getProducts.welltested_test.mocks.dart';import 'dart:convert';

import 'package:api_with_riverpod/src/controller/product_controller.dart';
import 'package:api_with_riverpod/src/models/product.dart';
import 'package:api_with_riverpod/src/repo/product_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'getProducts.welltested_test.mocks.dart';

@GenerateMocks([ProductRepo])
void main() {
  final mockProductRepo = MockProductRepo();
  final productController = ProductController(productRepo: mockProductRepo);

  test('getProducts returns a list of Product when the API call is successful',
      () async {
    // Arrange
    final response = http.Response(
      json.encode({
        'products': [
          {
            'id': 1,
            'title': 'Test Product 1',
            'description': 'Description 1',
            'price': 100,
            'discountPercentage': 10.0,
            'rating': 4.5,
            'stock': 10,
            'brand': 'Brand 1',
            'category': 'Category 1',
            'thumbnail': 'Thumbnail 1',
            'images': ['Image 1', 'Image 2']
          },
          {
            'id': 2,
            'title': 'Test Product 2',
            'description': 'Description 2',
            'price': 200,
            'discountPercentage': 20.0,
            'rating': 4.0,
            'stock': 20,
            'brand': 'Brand 2',
            'category': 'Category 2',
            'thumbnail': 'Thumbnail 2',
            'images': ['Image 3', 'Image 4']
          },
        ]
      }),
      200,
    );
    when(mockProductRepo.getProducts()).thenAnswer((_) async => response);

    // Act
    final result = await productController.getProducts();

    // Assert
    expect(result, result);
  });
}