import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/components/section_container.dart';
import 'package:store_app/models/Product.dart';
import 'package:store_app/screens/home/components/categories.dart';
import 'package:store_app/screens/home/components/special_products.dart';
import 'package:store_app/screens/home/components/title_part.dart';
import 'package:store_app/screens/product_list_page/product_list_page_screen.dart';
import 'package:store_app/size_config.dart';
import './banner.dart';
import 'hot_deals.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<String> hotDealList = [
    "assets/images/hot_deal_1.png",
    "assets/images/hot_deal_2.png",
    "assets/images/hot_deal_3.png"
  ];
  List<String> bannerList = [
    "assets/images/banner_1.png",
    "assets/images/banner_2.png",
    "assets/images/banner_3.png",
    "assets/images/banner_4.png",
  ];
  List<Product> specialProducts = demoProducts;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(
              getProportionateScreenWidth(10),
              getProportionateScreenWidth(10),
              getProportionateScreenWidth(10),
              getProportionateScreenWidth(10)),
          child: Column(
            children: [
              SectionCotainer(
                child: Column(
                  children: [
                    TitlePart(
                      text: "Hot deals",
                      press: () {},
                    ),
                    HotDeals(hotDealList: hotDealList),
                  ],
                ),
              ),
              SizedBox(height: 20),
              SectionCotainer(
                child: Column(children: [
                  TitlePart(
                    text: "Hot deals",
                    press: () {},
                  ),
                  Categories()
                ]),
              ),
              SizedBox(height: 20),
              SectionCotainer(
                child: Column(
                  children: [
                    TitlePart(
                      text: "Hot products",
                      press: () {
                        Get.to(() => ProductListPageScreen());
                      },
                    ),
                    SpecialProducts(),
                  ],
                ),
              ),
              SizedBox(height: 20),
              SectionCotainer(
                child: Column(
                  children: [
                    TitlePart(
                      text: "Recommend for you",
                      press: () {
                        // Get.to(() => ProductListPageScreen());
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
