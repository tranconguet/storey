import 'package:flutter/material.dart';
import 'package:store_app/screens/advertise_page/components/body.dart';

class AdvertiseScreen extends StatelessWidget {
  static String routeName = "/advertise";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Body(),
    );
  }
}
