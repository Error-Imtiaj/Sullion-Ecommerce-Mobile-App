import 'dart:convert';
import 'package:ecommerce_project/services/network%20caller/network_response.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

class NetworkCaller {

  final Logger _logger = Logger();


  // * FUNCTION TO GET RESPONSE FROM THE API
  Future<NetworkResponse> getResponse(String url) async {
    Uri uri = Uri.parse(url);
    try {
      Response response = await get(uri);
      log(url, response.statusCode, response.body, response.headers);
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
      log(url, -1, e.toString(), null);
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
      log(url, response.statusCode, data.toString(), response.headers);
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
      log(url, -1, e.toString(), null);
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }


  // * LOGGER FUNCTION
  void log(String url, int? statuscode, String? body, Map<String, dynamic>? headers,) {
    _logger.i("URL: $url \n StatusCode: $statuscode  \nBody: $body  \nHeaders: $headers");
  }
}
