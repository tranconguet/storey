import 'package:get/get.dart';
import 'package:store_app/controller/user_controller.dart';
import 'package:store_app/models/User.dart';

class SelectLocationController extends GetxController {
  var location = ''.obs;
  var locationList = List<Location>().obs;

  @override
  void onInit() {
    fetchLocationList();
    super.onInit();
  }

  fetchLocationList() async {
    locationList.value = Get.find<UserController>().user.value.locations;
  }

  saveLocationList(List<Location> newLocationList) {
    print("save");
    locationList.value = [];
    locationList.value = newLocationList;
  }

  saveLocation(String newLocation) {
    location.value = newLocation;
  }

  clear() {
    location.value = '';
  }
}
