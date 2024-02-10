import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive/Controller.dart';
import 'package:responsive/ProductDetail.dart';
import 'package:responsive/Model/ProductResponseModel.dart';

// ignore: must_be_immutable
class HomePhone extends StatelessWidget {

  final ProductController productController = Get.put(ProductController());
  bool showAllData = false;

  HomePhone({super.key});

  Future<void> _refreshData() async {
    await productController.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {

              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {

              },
            ),
          ],
        ),
      ),
      body: Obx(() {
        if (productController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          List<ProductResponseModel> displayedProducts = showAllData
              ? productController.productList
              : productController.productList.take(20).toList();

          return Column(
            children: [
              Expanded(
                child: RefreshIndicator(
                  onRefresh: _refreshData,
                  child: ListView.builder(
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
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(8),
                            title: Text(
                              product.title.length > 45
                                  ? product.title.substring(0, 45) + '...'
                                  : product.title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              'Price: \$${product.price}',
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                product.image,
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        }
      }),
    );
  }
}
