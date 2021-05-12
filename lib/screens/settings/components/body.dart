import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:store_app/components/default_button.dart';
import 'package:store_app/components/section_container.dart';
import 'package:store_app/controller/auth_controller.dart';
import 'package:store_app/controller/cart_controller.dart';
import 'package:store_app/controller/user_controller.dart';
import 'package:store_app/screens/splash/splash_screen.dart';
import 'package:store_app/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SettingsPart(
            title: "Account Settings",
            child: Column(
              children: [
                SettingSection(
                  text: "Your profile",
                  press: () {},
                ),
                SettingSection(
                  text: "Address",
                  press: () {},
                ),
                SettingSection(
                  text: "Digital Wallet",
                  press: () {},
                ),
              ],
            ),
          ),
          SettingsPart(
            title: "Application Settings",
            child: Column(
              children: [
                SettingSectionWithSwitch(
                    text: "Chat settings", press: (value) {}),
                SettingSectionWithSwitch(
                    text: "Notification settings", press: (value) {}),
                SettingSectionWithSwitch(text: "Language", press: (value) {}),
                SettingSectionWithSwitch(text: "Dark mode", press: (value) {}),
              ],
            ),
          ),
          SettingsPart(
            title: "Support",
            child: Column(
              children: [
                SettingSection(
                  text: "Support center",
                  press: () {},
                ),
                SettingSection(
                  text: "Tips & Tricks",
                  press: () {},
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            width: SizeConfig.screenWidth * 0.8,
            child: DefaultButton(
              text: "LOG OUT",
              press: () {
                Get.to(() => SplashScreen());
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsPart extends StatelessWidget {
  @override
  const SettingsPart({
    Key key,
    @required this.title,
    @required this.child,
  }) : super(key: key);

  final String title;
  final Widget child;

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: SectionCotainer(
        child: Container(
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 5),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Divider(color: Colors.black),
              child,
            ],
          ),
        ),
      ),
    );
  }
}

class SettingSection extends StatelessWidget {
  const SettingSection({
    Key key,
    @required this.text,
    @required this.press,
  }) : super(key: key);

  final String text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: press,
          child: Container(
            margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
            child: Row(
              children: [
                Text(
                  text,
                  style: TextStyle(fontSize: 18),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: SvgPicture.asset("assets/icons/arrow_right.svg"),
                ),
              ],
            ),
          ),
        ),
        Divider(color: Colors.black),
      ],
    );
  }
}

class SettingSectionWithSwitch extends StatelessWidget {
  const SettingSectionWithSwitch({
    Key key,
    @required this.text,
    @required this.press,
  }) : super(key: key);

  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SwitchListTile(
          activeColor: Colors.lightGreen,
          contentPadding: EdgeInsets.all(0),
          title: Text(
            text,
            style: TextStyle(fontSize: 18),
          ),
          value: true,
          onChanged: press,
        ),
        Divider(color: Colors.black),
      ],
    );
  }
}
