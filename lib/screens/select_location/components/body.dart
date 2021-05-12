import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:store_app/components/item_card_container.dart';
import 'package:store_app/controller/check_out_controller.dart';
import 'package:store_app/controller/select_location_controller.dart';
import 'package:store_app/models/User.dart';
import 'package:store_app/screens/select_location_information/select_location_information_screen.dart';
import 'package:store_app/size_config.dart';

class Body extends StatelessWidget {
  var _locationListController = Get.put(SelectLocationController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: double.infinity,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            ...List.generate(
              _locationListController.locationList.value.length,
              (index) => LocationItem(
                  location: _locationListController.locationList.value[index]),
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => SelectLocationInformationScreen());
              },
              child: ItemCardContainer(
                child: Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        width: SizeConfig.screenWidth * 0.7,
                        child: Text(
                          "Create new",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: SvgPicture.asset(
                          "assets/icons/Location point.svg",
                          height: 25,
                          color: Colors.lightGreen,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LocationItem extends StatelessWidget {
  const LocationItem({
    Key key,
    @required this.location,
  }) : super(key: key);

  final Location location;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.find<CheckOutController>().setLocation(location);
        Get.back();
      },
      child: ItemCardContainer(
        child: Container(
          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                width: SizeConfig.screenWidth * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      location.receiverName,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(location.phoneNumber),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      location.address,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: SvgPicture.asset(
                  "assets/icons/Location point.svg",
                  height: 25,
                  color: Colors.lightGreen,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
