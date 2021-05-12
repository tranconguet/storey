import 'package:get/get.dart';
import 'package:store_app/controller/special_product_controller.dart';
import 'package:store_app/models/Product.dart';
import 'package:store_app/services/api_services.dart';

class ProductListPageController extends GetxController {
  var type = ''.obs;
  var productList = List<Product>().obs;
  var isLoading = true.obs;

  Map<String, String> typeToType = {
    'Phone': 'phones',
    'Accessories': 'acs',
    'Tablet': 'tablets',
    'Laptop': 'laptops',
    'Watch': 'watches'
  };
  @override
  void onInit() async {
    // TODO: implement onInit
    setType("Phone");
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await ApiServices.fetchProducts(typeToType[type.value]);
      if (products != null) {
        productList.value = products;
        print(productList.value.length);
      }
    } finally {
      isLoading(false);
    }
  }

  void setType(String selectedType) {
    type.value = selectedType;
    fetchProducts();
  }
}
