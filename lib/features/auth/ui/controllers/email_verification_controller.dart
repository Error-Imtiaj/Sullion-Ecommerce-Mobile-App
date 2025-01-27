import 'package:ecommerce_project/app/urls.dart';
import 'package:ecommerce_project/services/network%20caller/network_caller.dart';
import 'package:ecommerce_project/services/network%20caller/network_response.dart';
import 'package:get/get.dart';

class EmailVerificationController extends GetxController {
  bool _inProgress = false;
  String? _errorMessage;

  bool get inProgress => _inProgress;
  String? get errorMessage => _errorMessage;

  Future<bool> verifyEmail(String email) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    // Call the API to verify the email
    final NetworkResponse response = await Get.find<NetworkCaller>()
        .getResponse(AppUrls.emailVerification(email));
    if (response.isSuccess) {
      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage;
      isSuccess = false;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }



}
