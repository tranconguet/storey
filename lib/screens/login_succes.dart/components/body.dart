import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:store_app/components/default_button.dart';
import 'package:store_app/screens/home/home_screen.dart';
import 'package:store_app/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: SizeConfig.screenHeight * 0.3,
          ),
          SvgPicture.asset(
            "assets/icons/Success.svg",
            color: Colors.lightGreen,
            width: SizeConfig.screenWidth * 0.5,
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.1,
          ),
          Text(
            "LOGIN SUCCESS",
            style: TextStyle(
              fontSize: getProportionateScreenHeight(30),
              color: Colors.lightGreen,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.15,
          ),
          SizedBox(
            width: SizeConfig.screenWidth * 0.6,
            child: DefaultButton(
              text: "back to home",
              press: () {
                Get.to(() => HomeScreen());
              },
            ),
          )
        ],
      ),
    );
  }
}
