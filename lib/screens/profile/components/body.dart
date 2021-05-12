import 'package:flutter/material.dart';
import 'package:store_app/screens/profile/components/profile_form.dart';
import 'package:store_app/size_config.dart';

class Body extends StatelessWidget {
  @override
  const Body({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  Container(
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.screenHeight * 0.2,
                    color: Colors.lightGreen,
                  ),
                  Container(
                    height: SizeConfig.screenHeight * 0.02,
                  ),
                ],
              ),
              Container(
                width: SizeConfig.screenWidth,
                child: Column(
                  children: [
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.05,
                    ),
                    Row(
                      children: [
                        Container(
                          width: SizeConfig.screenWidth * 0.35,
                          margin: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.blueGrey,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              "assets/images/avt.jpg",
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Tran Van Cong",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: getProportionateScreenWidth(20),
                              ),
                            ),
                            Text(
                              "Score: 123",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: getProportionateScreenWidth(20),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: ProfileForm(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
