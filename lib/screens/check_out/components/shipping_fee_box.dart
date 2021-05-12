import 'package:flutter/material.dart';
import 'package:store_app/controller/check_out_controller.dart';

import '../../../helpers.dart';

class ShippingFee extends StatelessWidget {
  const ShippingFee({
    Key key,
    @required CheckOutController checkOutController,
  })  : _checkOutController = checkOutController,
        super(key: key);

  final CheckOutController _checkOutController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.lightGreen[50],
        border: Border.all(color: Colors.lightGreen[100]),
      ),
      child: Row(
        children: [
          Text(
            "Shipping fee",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          Spacer(),
          Row(
            children: [
              _checkOutController.discountSelected != null
                  ? Text(numberToPrice(_checkOutController.shippingFee.value))
                  : Text(""),
              SizedBox(
                width: 10,
              ),
              // Container(
              //   margin: EdgeInsets.only(right: 10),
              //   child: SvgPicture.asset("assets/icons/arrow_right.svg"),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
