import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:store_app/components/item_card_container.dart';
import 'package:store_app/controller/check_out_controller.dart';
import 'package:store_app/helpers.dart';
import 'package:store_app/models/Discount.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Discount> discounts = Get.find<CheckOutController>().discountList.value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ...List.generate(
            discounts.length,
            (index) => DiscountCard(discount: discounts[index]),
          )
        ],
      ),
    );
  }
}

class DiscountCard extends StatelessWidget {
  const DiscountCard({
    Key key,
    @required this.discount,
  }) : super(key: key);

  final Discount discount;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.find<CheckOutController>().setDiscount(discount);
        Get.back();
      },
      child: ItemCardContainer(
        child: Container(
          margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    discount.name,
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("Value: ${discount.value}"),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                      "Expiry Date: ${formatDateTimetoTime(discount.endDate)}"),
                ],
              ),
              SvgPicture.asset(
                "assets/icons/Bill Icon.svg",
                color: Colors.lightGreen,
                height: 35,
              )
            ],
          ),
        ),
      ),
    );
  }
}
