import 'package:api_with_riverpod/src/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
      ),

      body: FutureBuilder(
        future: ref.watch(productControllerProvider).getProducts(),
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