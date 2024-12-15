import 'package:apple_highland/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Dio dio = Dio(
  BaseOptions(
      baseUrl: dotenv.get('API'),
      contentType: Headers.formUrlEncodedContentType,
      validateStatus: (status) => true,
      headers: {'Authorization': 'Bearer ${getStorage.read('token')}'}),
);
