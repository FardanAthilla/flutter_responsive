import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive/Controller.dart';
import 'package:responsive/ProductDetail.dart';
import 'package:responsive/Model/ProductResponseModel.dart';

class HomeTablet extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  bool showAllData = false;

  HomeTablet({super.key});

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
          Container(
            width: 250, 
            color: Colors.grey[200], 
            child: ListView(
              children: [
                ListTile(
                  title: Text('Menu 1'),
                  onTap: () {

                  },
                ),
                ListTile(
                  title: Text('Menu 2'),
                  onTap: () {

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
                List<ProductResponseModel> displayedProducts = showAllData
                    ? productController.productList
                    : productController.productList.take(20).toList();

                return RefreshIndicator(
                  onRefresh: _refreshData,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    itemCount: displayedProducts.length,
                    itemBuilder: (context, index) {
                      final product = displayedProducts[index];
                      return GestureDetector(
                        onTap: () {
                          Get.to(() => ProductDetailPage(product: product));
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
                                      product.title.length > 45
                                          ? product.title.substring(0, 45) +
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
