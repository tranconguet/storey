import 'package:flutter/material.dart';
import 'package:store_app/models/ProductArgument.dart';
import './components/bottom_bar.dart';
import './components/body.dart';

class ProductDetailsScreen extends StatelessWidget {
  static String routeName = "/product_details";

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments arguments =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(),
      body: Body(
        product: arguments.product,
      ),
      bottomNavigationBar: BottomBar(
        product: arguments.product,
      ),
    );
  }
}
