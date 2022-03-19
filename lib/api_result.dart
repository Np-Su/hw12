class ApiResult {
  final String status;
  final String? message;
  final String data;

  ApiResult({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ApiResult.fromJson(Map<String, dynamic> json) {
    return ApiResult(
      status: json['status'],
      message: json['message'],
      data: json['data'],
    );
  }
}