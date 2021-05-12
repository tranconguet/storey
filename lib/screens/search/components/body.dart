import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/search_page_controller.dart';
import 'package:store_app/screens/home/components/special_products.dart';

class Body extends StatelessWidget {
  var searchController = Get.put(SearchController());
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: EdgeInsets.all(20),
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          childAspectRatio: MediaQuery.of(context).size.height / 1300,
          padding: const EdgeInsets.all(10.0),
          mainAxisSpacing: 20,
          children: [
            ...List.generate(
              searchController.productList.value.length,
              (index) => ProductCard(
                product: searchController.productList.value[index],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
