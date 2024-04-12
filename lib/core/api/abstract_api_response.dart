class AbstractApiResponse {
  AbstractApiResponse({this.code, this.status, this.data});

  factory AbstractApiResponse.fromJson(Map<String, dynamic> json) {
    return AbstractApiResponse(
      code: json['code'],
      status: json['status'],
      data: json['data'],
    );
  }

  final num? code;
  final String? status;
  final dynamic data;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    data['data'] = this.data;
    return data;
  }
}

class ResponseHelper {
  static AbstractApiResponse handleResponse(dynamic response) {
    return AbstractApiResponse.fromJson(response.data);
  }
}
