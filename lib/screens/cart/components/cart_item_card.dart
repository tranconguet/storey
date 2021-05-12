import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:store_app/components/item_card_container.dart';
import 'package:store_app/controller/cart_controller.dart';
import 'package:store_app/models/CartItem.dart';
import 'package:store_app/models/ProductArgument.dart';
import 'package:store_app/screens/cart/components/quantity_item_counter.dart';
import 'package:store_app/screens/cart/components/remove_item_button.dart';
import 'package:store_app/screens/product_details/product_details_screen.dart';

import '../../../size_config.dart';

// class CartItemCard extends StatefulWidget {
//   @override
//   final CartItem item;

//   const CartItemCard({Key key, @required this.item}) : super(key: key);
//   _CartItemCardState createState() => _CartItemCardState();
// }

class CartItemCard extends StatefulWidget {
  final CartItem item;

  const CartItemCard({
    Key key,
    this.item,
  }) : super(key: key);

  @override
  _CartItemCardState createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  @override
  Widget build(BuildContext context) {
    // bool isChosen = widget.item.isChosen;
    return ItemCardContainer(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Checkbox(
            value: widget.item.isChosen,
            onChanged: (value) {
              Get.find<CartController>()
                  .toggleChosenCheckBox(widget.item.product.id, value);
            },
          ),
          tapToNavigateToProductDetails(
            context: context,
            item: widget.item.product,
            child: Column(
              children: [
                SizedBox(
                  width: getProportionateScreenWidth(70),
                  child: Image.asset(widget.item.product.images[0]),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(5),
                ),
              ],
            ),
          ),
          SizedBox(
            width: getProportionateScreenWidth(160),
            child: Column(
              children: [
                tapToNavigateToProductDetails(
                  context: context,
                  item: widget.item.product,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          widget.item.product.title,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          widget.item.product.price,
                          style: TextStyle(fontSize: 14, color: Colors.red),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                QuantityCounter(widget: widget),
              ],
            ),
          ),
          SizedBox(
            width: 15,
          ),
          RemoveItemButton(widget: widget)
        ],
      ),
    );
  }
}

GestureDetector tapToNavigateToProductDetails({Widget child, context, item}) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(
        context,
        ProductDetailsScreen.routeName,
        arguments: ProductDetailsArguments(product: item),
      );
    },
    child: child,
  );
}
