import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/product_page_controller.dart';
import 'package:store_app/screens/home/components/special_products.dart';
import 'package:store_app/screens/product_list_page/components/product_type_selections.dart';

class Body extends StatelessWidget {
  var _controller = Get.find<ProductListPageController>();

  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          CustomProductTypeSelections(
            type: _controller.type.value,
          ),
          !_controller.isLoading.value
              ? Expanded(
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    childAspectRatio: MediaQuery.of(context).size.height / 1300,
                    padding: const EdgeInsets.all(10.0),
                    mainAxisSpacing: 20,
                    children: [
                      ...List.generate(
                        _controller.productList.value.length,
                        (index) => ProductCard(
                          product: _controller.productList.value[index],
                        ),
                      ),
                    ],
                  ),
                )
              : CircularProgressIndicator(),
        ],
      ),
    );
  }
}
