class NetworkResponse {
  final bool isSuccess;
  final dynamic responseMessage;
  final int statusCode;
  final String errorMessage;

  NetworkResponse({
    required this.isSuccess,
    this.responseMessage,
    required this.statusCode,
    this.errorMessage = 'Something went wrong',
  });
}
