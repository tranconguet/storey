import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/auth_controller.dart';
import './components/body.dart';

class LoginScreen extends GetWidget<AuthController> {
  static String routeName = "/login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Body(),
    );
  }
}
