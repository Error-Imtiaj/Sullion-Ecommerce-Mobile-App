import 'package:ecommerce_project/features/common/ui/controllers/main_nav_button_controller.dart';
import 'package:ecommerce_project/features/product/ui/controller/cart_number_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainNavButtonController());
    Get.put(CartNumberController());
  }
}
