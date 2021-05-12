import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:store_app/components/bottom_bar.dart';
import 'package:store_app/components/heading_bar.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/controller/user_controller.dart';
import 'package:store_app/screens/home/components/body.dart';
import 'package:store_app/screens/product_list_page/product_list_page_screen.dart';
import 'package:store_app/screens/profile/profile_screen.dart';
import 'package:store_app/size_config.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Builder(
          builder: (context) => HeadingBar(
            openDrawer: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      body: Body(),
      bottomNavigationBar: BottomBar(
        selectedRoute: routeName,
      ),
      drawer: CustomDrawer(),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeading(),
          CustomListTile(
            icon: "assets/icons/vhome.svg",
            title: "Home",
            press: () {
              Get.to(() => HomeScreen());
            },
          ),
          CustomListTile(
            icon: "assets/icons/vperson.svg",
            title: "Profile",
            press: () {
              Get.to(() => ProfileScreen());
            },
          ),
          CustomListTile(
            icon: "assets/icons/vsmartphone.svg",
            title: "Product",
            press: () {
              Get.to(() => ProductListPageScreen());
            },
          ),
        ],
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key key,
    this.icon,
    this.title,
    this.press,
  }) : super(key: key);

  final GestureTapCallback press;
  final String icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(),
        child: Row(
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  icon,
                  height: 20,
                  color: kSecondaryColor,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

class DrawerHeading extends StatelessWidget {
  const DrawerHeading({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(
        color: Colors.lightGreen,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              "assets/images/avt.jpg",
              width: SizeConfig.screenWidth * 0.28,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          SizedBox(
            width: SizeConfig.screenWidth * 0.3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Get.find<UserController>().user.value.userName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Score: 123",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
