import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store_app/screens/sign_up/components/sign_up_form.dart';

import '../../../size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.screenHeight * 0.35,
              width: SizeConfig.screenWidth * 0.6,
              child: SvgPicture.asset("assets/images/form.svg"),
            ),
            SignUpForm(),
          ],
        ),
      ),
    );
  }
}
