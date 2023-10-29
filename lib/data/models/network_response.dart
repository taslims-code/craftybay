class NetworkResponse {
  final bool isSuccess;
  final int statusCode;
  final Map<String, dynamic>? jsonResponse;

  NetworkResponse(
    this.isSuccess,
    this.statusCode,
    this.jsonResponse,
  );
}
