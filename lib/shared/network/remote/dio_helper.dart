import 'package:dio/dio.dart';

class DioHelper {
  static Dio dio;

  DioHelper() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://softagic.wwwnl1-ss19.a2hosted.com/',
        headers: {
          'Accept': 'application/json',
        },
      ),
    );
  }

  static Future<Response> postData(
      {String path, Map data, token, query}) async {
    if (token != null) {
      dio.options.headers = {'Authorization': 'Bearer $token'};
    }

    return await dio.post(
      path,
      data: data ?? null,
      queryParameters: query ?? null,
    );
  }

  static Future<Response> postNotification({path, data}) async {
    dio.options.baseUrl = 'https://fcm.googleapis.com/';

    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization':
          'key=AAAAi81qjqo:APA91bFouGdicuLRlWUEueQEduLd_gUyYKWQp_B1h9Kbs2dpPaIwQUCxXZJdkNUPNwbKvzD1SU-1P3Peq3kFgtzfDyp7GuhMG-3PO5A13nBzdwuYcY5BJqYo9sJwQbwJo4itQb3J7x5d',
    };

    return await dio.post(
      path,
      data: data ?? null,
    );
  }
}
