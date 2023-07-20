import 'package:api_with_riverpod/src/controller/product_controller.dart';
import 'package:api_with_riverpod/src/repo/product_repo.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
      ),

      body: FutureBuilder(
        future: ProductController().getProducts(),
        builder: (context, snapshot) {

          snapshot.data;

          if(snapshot.data == null){
            return const Center(child: CircularProgressIndicator(),);
          }

          final products = snapshot.data!;

          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(products[index].title, style: const TextStyle(fontSize: 20),),
                    Text(products[index].description),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}