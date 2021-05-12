import 'package:flutter/material.dart';
import 'package:store_app/components/bottom_bar.dart';

import './components/body.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
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
