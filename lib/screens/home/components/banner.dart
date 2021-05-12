import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class Banners extends StatefulWidget {
  final List<String> bannerList;

  const Banners({
    Key key,
    @required this.bannerList,
  }) : super(key: key);
  @override
  _BannersState createState() => _BannersState(bannerList);
}

class _BannersState extends State<Banners> {
  int currentBanner = 0;
  final List<String> bannerList;

  _BannersState(this.bannerList);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: SizeConfig.screenHeight * 0.15,
          child: PageView.builder(
            onPageChanged: (value) {
              setState(() {
                currentBanner = value;
              });
            },
            itemCount: bannerList.length,
            itemBuilder: (context, index) => Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  bannerList[index],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: buildDots(),
          ),
        ),
      ],
    );
  }

  Container buildDots() {
    return Container(
      width: SizeConfig.screenWidth * 0.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          bannerList.length,
          (index) => AnimatedContainer(
            duration: Duration(milliseconds: 200),
            margin: EdgeInsets.all(getProportionateScreenWidth(4)),
            height: 10,
            width: index == currentBanner ? 30 : 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color:
                  index == currentBanner ? Colors.lightGreen : kSecondaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
