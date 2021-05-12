import 'package:flutter/material.dart';
import 'package:store_app/components/bottom_bar.dart';
import './components/body.dart';

class FavScreen extends StatelessWidget {
  static String routeName = "/fav_product";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: BottomBar(
        selectedRoute: routeName,
      ),
    );
  }
}
