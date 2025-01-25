import 'package:get/get.dart';

class CartNumberController extends GetxController {
  final RxInt cartNum = 1.obs;

  void increment() {
    cartNum.value++;
  }

  void decrement() {
    if (cartNum.value == 1) {
      return;
    }
    cartNum.value--;
  }
}
