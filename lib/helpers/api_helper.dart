import 'package:dio/dio.dart';

import 'api_const.dart';

class ApiHelper {
  // Singleton
  ApiHelper._();
  static ApiHelper instance = ApiHelper._();

  Dio _dio = Dio(BaseOptions(baseUrl: ApiConst.BASE_URL, headers: {
    "lang": "en",
    "Content-Type": "application/json",
  }));

  Future<Response> postData({
    required String path,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response =
        await _dio.post(path, data: body, queryParameters: queryParameters);
    return response;
  }
}

/// method : Post
/// url :"https://student.valuxapps.com/api/"
/// no parameter found
/// header : lang : en,Content-Type:application/json
/// body : email ,password
