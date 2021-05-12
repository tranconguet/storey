import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:store_app/components/button_with_shadow.dart';
import 'package:store_app/components/custom_surffix_icon.dart';
import 'package:store_app/components/item_card_container.dart';
import 'package:store_app/controller/check_out_controller.dart';
import 'package:store_app/controller/select_location_controller.dart';
import 'package:store_app/controller/user_controller.dart';
import 'package:store_app/models/User.dart';
import 'package:store_app/screens/choose_location_on_map/choose_location_on_map_screen.dart';
import 'package:store_app/size_config.dart';

import '../../../constants.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final userController = Get.find<UserController>();
  final _selectLocationController = Get.find<SelectLocationController>();

  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  TextEditingController _phoneNumberController =
      new TextEditingController(text: '');
  TextEditingController _receiverNameController =
      new TextEditingController(text: '');

  void addError({String error}) {
    setState(() {
      if (!errors.contains(error)) {
        errors.add(error);
      }
    });
  }

  void removeError({String error}) {
    setState(() {
      if (errors.contains(error)) {
        errors.remove(error);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Obx(
        () => Container(
          width: double.infinity,
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              buildPhoneNumberTextField(),
              SizedBox(
                height: 20,
              ),
              buildReceiverNameTextField(),
              GestureDetector(
                onTap: () {
                  Get.to(() => ChooseLocationOnMapScreen());
                },
                child: ItemCardContainer(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                              width: SizeConfig.screenWidth * 0.7,
                              child: Text(
                                "Choose new location",
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
                        _selectLocationController.location.value != ''
                            ? Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Text(
                                    _selectLocationController.location.value),
                              )
                            : SizedBox(
                                height: 1,
                              ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonWithShadow(
                      text: Text(
                        "CREATE",
                        style: TextStyle(
                          fontSize: 24,
                          color: kPrimaryColor,
                        ),
                      ),
                      press: () {
                        if (_formKey.currentState.validate()) {
                          if (_selectLocationController.location.value != '') {
                            Location newLocation = Location(
                              phoneNumber: _phoneNumberController.text,
                              address: _selectLocationController.location.value,
                              receiverName: _receiverNameController.text,
                              length:
                                  Get.find<CheckOutController>().length.value,
                            );
                            userController.addNewLocation(newLocation);
                            _selectLocationController.saveLocationList(
                                userController.user.value.locations);
                            Get.back();
                          }
                        }
                      },
                    ),
                    ButtonWithShadow(
                      text: Text(
                        "CANCEL",
                        style: TextStyle(
                          fontSize: 24,
                          color: kSecondaryColor,
                        ),
                      ),
                      press: () {
                        Get.back();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildPhoneNumberTextField() {
    return TextFormField(
      controller: _phoneNumberController,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
      },
      onSaved: (newValue) {},
      validator: (value) {
        if (value.isEmpty && !errors.contains(kPhoneNumberNullError)) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Phone number",
        hintText: "Enter your phone number",
        labelStyle: TextStyle(
          fontSize: getProportionateScreenHeight(25),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          surffixIcon: "assets/icons/Phone.svg",
        ),
      ),
    );
  }

  TextFormField buildReceiverNameTextField() {
    return TextFormField(
      controller: _receiverNameController,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        }
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(kEmailNullError)) {
          addError(error: kEmailNullError);
          return "";
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Receiver name",
        hintText: "Enter receiver name",
        labelStyle: TextStyle(
          fontSize: getProportionateScreenHeight(25),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          surffixIcon: "assets/icons/User Icon.svg",
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
