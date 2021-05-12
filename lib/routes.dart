import 'package:flutter/material.dart';
import 'package:store_app/screens/advertise_page/advertise_page_screen.dart';
import 'package:store_app/screens/check_out/check_out_screen.dart';
import 'package:store_app/screens/choose_location_on_map/choose_location_on_map_screen.dart';
import 'package:store_app/screens/discount/discount_screen.dart';
import 'package:store_app/screens/order_success/order_success_screen.dart';
import 'package:store_app/screens/otp/otp_screen.dart';
import 'package:store_app/screens/cart/cart_screen.dart';
import 'package:store_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:store_app/screens/fav_products/fav_screen.dart';
import 'package:store_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:store_app/screens/home/home_screen.dart';
import 'package:store_app/screens/login/login_screen.dart';
import 'package:store_app/screens/login_succes.dart/login_success_screen.dart';
import 'package:store_app/screens/message/message_screen.dart';
import 'package:store_app/screens/product_details/product_details_screen.dart';
import 'package:store_app/screens/product_list_page/product_list_page_screen.dart';
import 'package:store_app/screens/profile/profile_screen.dart';
import 'package:store_app/screens/search/search_screen.dart';
import 'package:store_app/screens/select_location/select_location_screen.dart';
import 'package:store_app/screens/select_location_information/select_location_information_screen.dart';
import 'package:store_app/screens/settings/settings_screen.dart';
import 'package:store_app/screens/sign_up/sign_up_screen.dart';
import 'package:store_app/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  ProductDetailsScreen.routeName: (context) => ProductDetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  MessageScreen.routeName: (context) => MessageScreen(),
  FavScreen.routeName: (context) => FavScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  SettingsScreen.routeName: (context) => SettingsScreen(),
  SearchScreen.routeName: (context) => SearchScreen(),
  CheckOutScreen.routeName: (context) => CheckOutScreen(),
  OrderSuccessScreen.routeName: (context) => OrderSuccessScreen(),
  SelectLocationScreen.routeName: (context) => SelectLocationScreen(),
  DiscountScreen.routeName: (context) => DiscountScreen(),
  ChooseLocationOnMapScreen.routeName: (context) => ChooseLocationOnMapScreen(),
  SelectLocationInformationScreen.routeName: (context) =>
      SelectLocationInformationScreen(),
  ProductListPageScreen.routeName: (context) => ProductListPageScreen(),
  AdvertiseScreen.routeName: (context) => AdvertiseScreen(),
};
