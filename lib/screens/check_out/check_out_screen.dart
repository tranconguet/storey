import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/check_out_controller.dart';
import 'package:store_app/screens/check_out/components/body.dart';

class CheckOutScreen extends StatelessWidget {
  static String routeName = "/check-out";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Check out",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}
