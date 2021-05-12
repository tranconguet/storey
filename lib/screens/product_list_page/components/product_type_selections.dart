import 'package:flutter/material.dart';
import 'package:store_app/models/Product.dart';

import 'custom_type_button.dart';

class CustomProductTypeSelections extends StatelessWidget {
  const CustomProductTypeSelections({
    Key key,
    this.type,
  }) : super(key: key);

  final String type;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...List.generate(
              productTypeList.length,
              (index) => CustomProductTypeButton(
                    currentType: type,
                    text: productTypeList[index],
                  )),
        ],
      ),
    );
  }
}
