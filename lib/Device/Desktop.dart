import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive/Controller.dart';
import 'package:responsive/ProductDetail.dart';
import 'package:responsive/Model/ProductResponseModel.dart';

class HomeDesktop extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  HomeDesktop({super.key});

  Future<void> _refreshData() async {
    await productController.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: Row(
        children: [
          // Sidebar
          Container(
            width: 250,
            color: Colors.grey[200],
            child: ListView(
              children: [
                ListTile(
                  title: Text('Menu 1'),
                  onTap: () {
                    // Add functionality for Menu 1
                  },
                ),
                ListTile(
                  title: Text('Menu 2'),
                  onTap: () {
                    // Add functionality for Menu 2
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              if (productController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return RefreshIndicator(
                  onRefresh: _refreshData,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    itemCount: productController.productList.length,
                    itemBuilder: (context, index) {
                      final product = productController.productList[index];
                      return GestureDetector(
                        onTap: () {
                          Get.to(ProductDetailPage(product: product));
                        },
                        child: Card(
                          elevation: 3,
                          margin: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    product.image,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.title.length > 20
                                          ? product.title.substring(0, 20) +
                                              '...'
                                          : product.title,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Price: \$${product.price}',
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
