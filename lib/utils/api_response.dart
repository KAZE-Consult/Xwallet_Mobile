class ApiResponse<T> {
  T? data;
  String? error;
  bool hasError;

  ApiResponse({this.data, this.error, this.hasError = false});

  factory ApiResponse.success(T data) {
    return ApiResponse(data: data);
  }

  factory ApiResponse.error(String error) {
    return ApiResponse(error: error, hasError: true);
  }
}
