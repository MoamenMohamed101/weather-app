import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

// num1
class ApiRepo {
  Dio? _dio;
  String? url;
  Map<String, dynamic>? payload;

  ApiRepo({this.url, this.payload});

  getData({
    @required Function()? beforeSend,
    @required Function(Map<String, dynamic> data)? onSuccess,
    @required Function()? onError,
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
