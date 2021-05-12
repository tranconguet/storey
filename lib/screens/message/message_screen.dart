import 'package:flutter/material.dart';
import 'package:store_app/components/bottom_bar.dart';
import './components/body.dart';

class MessageScreen extends StatelessWidget {
  static String routeName = "/message";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Message",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Body(),
      bottomNavigationBar: BottomBar(
        selectedRoute: routeName,
      ),
    );
  }
}
