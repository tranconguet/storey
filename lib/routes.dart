import 'imports.dart';

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
  AdminOrdersScreen.routeName: (context) => AdminOrdersScreen(),
  AdminProductsScreen.routeName: (context) => AdminProductsScreen(),
  AdminUsersScreen.routeName: (context) => AdminUsersScreen(),
  EditUserInfoScreen.routeName: (context) => EditUserInfoScreen(),
  EditOrderScreen.routeName: (context) => EditOrderScreen(),
  EditProductScreen.routeName: (context) => EditProductScreen(),
};
