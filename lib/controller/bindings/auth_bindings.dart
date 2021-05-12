import 'package:get/get.dart';
import 'package:store_app/controller/auth_controller.dart';
import 'package:store_app/controller/user_controller.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController());
    Get.put<UserController>(UserController(), permanent: true);
    // TODO: implement dependencies
  }
}
