import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/screens/advertise_page/advertise_page_screen.dart';

import '../../../size_config.dart';

class HotDeals extends StatelessWidget {
  const HotDeals({
    Key key,
    @required this.hotDealList,
  }) : super(key: key);

  final List<String> hotDealList;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => AdvertiseScreen());
      },
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                hotDealList.length,
                (index) => Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.blueGrey[400],
                        ),
                      ),
                      width: SizeConfig.screenWidth * 0.45,
                      child: SizedBox(
                        width: getProportionateScreenWidth(230),
                        height: getProportionateScreenWidth(80),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            hotDealList[index],
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
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
