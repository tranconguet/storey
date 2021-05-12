import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/special_product_controller.dart';
import 'package:store_app/models/Product.dart';
import 'package:store_app/models/ProductArgument.dart';
import 'package:store_app/screens/product_details/product_details_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SpecialProducts extends StatelessWidget {
  final specialProductsController = Get.put(SpecialProductsController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          ProductTypeSelections(
              specialProductsController: specialProductsController),
          !specialProductsController.isLoading.value
              ? Container(
                  padding:
                      EdgeInsets.only(top: getProportionateScreenWidth(10)),
                  width: SizeConfig.screenWidth * 0.9,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ProductCard(
                              product:
                                  specialProductsController.productList[0]),
                          ProductCard(
                              product: specialProductsController.productList[1])
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ProductCard(
                              product:
                                  specialProductsController.productList[2]),
                          ProductCard(
                              product: specialProductsController.productList[3])
                        ],
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

class ProductTypeSelections extends StatelessWidget {
  const ProductTypeSelections({
    Key key,
    @required this.specialProductsController,
  }) : super(key: key);

  final SpecialProductsController specialProductsController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...List.generate(
              productTypeList.length,
              (index) => ProductTypeButton(
                    currentType: specialProductsController.menuType.value,
                    text: productTypeList[index],
                    press: () {
                      specialProductsController
                          .changeType(productTypeList[index]);
                    },
                  )),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductDetailsScreen.routeName,
          arguments: ProductDetailsArguments(product: product),
        );
      },
      child: SizedBox(
        width: SizeConfig.screenWidth * 0.4,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              width: SizeConfig.screenWidth * 0.35,
              height: SizeConfig.screenHeight * 0.2,
              child: Image.asset(product.images[0]),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            SizedBox(height: 5),
            Text(
              product.title,
              textAlign: TextAlign.center,
            ),
            Text(
              product.price,
              style: TextStyle(color: Colors.red),
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}

class ProductTypeButton extends StatelessWidget {
  const ProductTypeButton({
    Key key,
    @required this.currentType,
    @required this.text,
    @required this.press,
  }) : super(key: key);

  final String currentType;
  final String text;
  final GestureTapCallback press;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: EdgeInsets.only(
          right: getProportionateScreenWidth(15),
          left: getProportionateScreenWidth(15),
        ),
        margin: EdgeInsets.only(right: getProportionateScreenWidth(10)),
        height: getProportionateScreenHeight(30),
        decoration: BoxDecoration(
          color: currentType == text
              ? kSecondaryColor.withOpacity(0.4)
              : kSecondaryColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontSize: getProportionateScreenHeight(16),
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
