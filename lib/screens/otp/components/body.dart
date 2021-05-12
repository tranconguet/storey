import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/components/default_button.dart';
import 'package:store_app/screens/complete_profile/complete_profile_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class Body extends StatelessWidget {
  final arg;

  const Body({
    Key key,
    @required this.arg,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              Text(
                "OTP Verification",
                style: headingStyle,
              ),
              SizedBox(height: 10),
              Text("We send your code to +84 866 603 ***"),
              buildTimer(),
              SizedBox(height: SizeConfig.screenHeight * 0.15),
              OtpForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.15),
              DefaultButton(
                text: "Continue",
                press: () {
                  Get.to(() => CompleteProfileScreen(), arguments: arg);
                },
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.15),
              GestureDetector(
                onTap: () {
                  //Re-send OTP code
                },
                child: Text(
                  "Re-send OTP Code",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("This code will expired in "),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0),
          duration: Duration(seconds: 30),
          builder: (context, value, child) => Text(
            "00:${value.toInt()}",
            style: TextStyle(color: kPrimaryColor),
          ),
          onEnd: () {},
        ),
      ],
    );
  }
}

class OtpForm extends StatefulWidget {
  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  FocusNode pin2focusNode;
  FocusNode pin3focusNode;
  FocusNode pin4focusNode;
  @override
  void initState() {
    super.initState();
    pin2focusNode = FocusNode();
    pin3focusNode = FocusNode();
    pin4focusNode = FocusNode();
  }

  void dispose() {
    pin2focusNode.dispose();
    pin3focusNode.dispose();
    pin4focusNode.dispose();
    super.dispose();
  }

  void nextField({String value, FocusNode focusNode}) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: getProportionateScreenWidth(60),
          child: TextFormField(
            autofocus: true,
            obscureText: true,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 26),
            keyboardType: TextInputType.number,
            decoration: otpInputDecoration,
            onChanged: (value) {
              nextField(value: value, focusNode: pin2focusNode);
            },
          ),
        ),
        SizedBox(
          width: getProportionateScreenWidth(60),
          child: TextFormField(
            focusNode: pin2focusNode,
            obscureText: true,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 26),
            keyboardType: TextInputType.number,
            decoration: otpInputDecoration,
            onChanged: (value) {
              nextField(value: value, focusNode: pin3focusNode);
            },
          ),
        ),
        SizedBox(
          width: getProportionateScreenWidth(60),
          child: TextFormField(
            focusNode: pin3focusNode,
            obscureText: true,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 26),
            keyboardType: TextInputType.number,
            decoration: otpInputDecoration,
            onChanged: (value) {
              nextField(value: value, focusNode: pin4focusNode);
            },
          ),
        ),
        SizedBox(
          width: getProportionateScreenWidth(60),
          child: TextFormField(
            focusNode: pin4focusNode,
            obscureText: true,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 26),
            keyboardType: TextInputType.number,
            decoration: otpInputDecoration,
            onChanged: (value) {
              pin4focusNode.unfocus();
            },
          ),
        ),
      ],
    );
  }
}
