import 'package:apple_highland/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final Dio dio = Dio(
  BaseOptions(
    baseUrl: dotenv.get('API'),
    contentType: Headers.formUrlEncodedContentType,
    validateStatus: (status) => true,
  ),
)..interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        final token = getStorage.read('token');
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        handler.next(options);
      },
    ),
  );
