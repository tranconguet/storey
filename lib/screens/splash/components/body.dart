import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/components/default_button.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/controller/auth_controller.dart';
import 'package:store_app/controller/user_controller.dart';
import 'package:store_app/screens/login/login_screen.dart';
import 'package:store_app/screens/splash/components/splash_content.dart';
import 'package:store_app/size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "image": "assets/images/splash_1.svg",
      "text": "Lorem ipsum dolor sit amet, \nconsectetur adipiscing elit."
    },
    {
      "image": "assets/images/splash_2.svg",
      "text": "Lorem ipsum dolor sit amet, \nconsectetur adipiscing elit."
    },
    {
      "image": "assets/images/splash_3.svg",
      "text": "Lorem ipsum dolor sit amet, \nconsectetur adipiscing elit."
    },
  ];
  @override
  Widget build(BuildContext context) {
    // Get.find<AuthController>().onInit();
    // Get.find<UserController>().onInit();
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.screenHeight * 0.1,
              ),
              Text(
                "WELCOME",
                style: headingStyle,
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.1,
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.45,
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: splashData.length,
                  itemBuilder: (context, index) => SpashContent(
                    image: splashData[index]["image"],
                    text: splashData[index]["text"],
                  ),
                ),
              ),
              buildDots(),
              SizedBox(
                height: SizeConfig.screenHeight * 0.05,
              ),
              SizedBox(
                width: SizeConfig.screenWidth * 0.6,
                child: DefaultButton(
                  text: "Continue",
                  press: () {
                    Get.to(() => LoginScreen());
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row buildDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        splashData.length,
        (index) => AnimatedContainer(
          duration: Duration(milliseconds: 200),
          margin: EdgeInsets.all(getProportionateScreenWidth(4)),
          height: 10,
          width: index == currentPage ? 30 : 15,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: index == currentPage ? Colors.lightGreen : kSecondaryColor,
          ),
        ),
      ),
    );
  }
}
