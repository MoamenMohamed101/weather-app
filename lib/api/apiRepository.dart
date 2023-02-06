import 'package:dio/dio.dart';
// num1
class ApiRepo {
  Dio? _dio;
  String? url;
  Map<String, dynamic>? payload;

  ApiRepo({this.url, this.payload});

  getData({
    Function()? beforeSend,
    Function(Map<String, dynamic> data)? onSuccess,
    Function()? onError,
  }) {
    _dio!.get(url!, queryParameters: payload).then((value) {
      if (onSuccess != null) {
        onSuccess(value.data);
      }
    }).catchError((error) {
      onError!();
    });
  }
}
