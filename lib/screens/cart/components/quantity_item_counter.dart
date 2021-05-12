import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/cart_controller.dart';

import '../../../size_config.dart';
import 'cart_item_card.dart';

class QuantityCounter extends StatelessWidget {
  const QuantityCounter({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final CartItemCard widget;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: SizedBox(
        width: getProportionateScreenWidth(70),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                if (widget.item.numOfItem > 1)
                  Get.find<CartController>().changeProductQuantity(
                      widget.item.product.id, widget.item.numOfItem - 1);
              },
              child: SizedBox(
                width: getProportionateScreenWidth(15),
                height: getProportionateScreenWidth(15),
                child: SvgPicture.asset("assets/icons/remove.svg"),
              ),
            ),
            Text(
              widget.item.numOfItem.toString(),
              style: TextStyle(fontSize: getProportionateScreenWidth(15)),
            ),
            GestureDetector(
              onTap: () {
                if (widget.item.numOfItem < 20)
                  Get.find<CartController>().changeProductQuantity(
                      widget.item.product.id, widget.item.numOfItem + 1);
              },
              child: SizedBox(
                width: getProportionateScreenWidth(15),
                height: getProportionateScreenWidth(15),
                child: SvgPicture.asset("assets/icons/plus.svg"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
