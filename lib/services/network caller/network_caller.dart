import 'dart:convert';
import 'package:ecommerce_project/services/network%20caller/network_response.dart';
import 'package:http/http.dart';

class NetworkCaller {
  // * FUNCTION TO GET RESPONSE FROM THE API
  Future<NetworkResponse> getResponse(String url) async {
    Uri uri = Uri.parse(url);
    try {
      Response response = await get(uri);
      if (response.statusCode != 200) {
        return NetworkResponse(
            isSuccess: false,
            statusCode: response.statusCode,
            errorMessage: 'Failed to fetch data');
      }
      dynamic responseBody = jsonDecode(response.body);
      return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          responseMessage: responseBody);
    } catch (e) {
      return NetworkResponse(
          isSuccess: false, statusCode: -1, errorMessage: e.toString());
    }
  }

  // * FUNCTION TO POST DATA TO THE API
  Future<NetworkResponse> postData(String url, dynamic data) async {
    Uri uri = Uri.parse(url);
    try {
      Response response = await post(
        uri,
        body: jsonEncode(data),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode != 200) {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: 'Failed to fetch data',
        );
      }
      dynamic responseBody = jsonDecode(response.body);
      return NetworkResponse(
        isSuccess: true,
        statusCode: response.statusCode,
        responseMessage: responseBody,
      );
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }
}
