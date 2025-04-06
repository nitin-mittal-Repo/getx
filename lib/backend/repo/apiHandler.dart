

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiHandler{

  static Future<Response> return200Response(Response response) async {
    debugPrint("Request: ${response.data}");

    switch (response.statusCode) {
      case 200:
        return response;

      case 400:
        debugPrint("Bad Request: ${response.data}");
        throw Exception("Bad Request");

      case 401:
        debugPrint("Unauthorized: ${response.data}");
        throw Exception("Unauthorized");

      case 409:
        debugPrint("Conflict: ${response.data}");
        throw Exception("Conflict");

      case 500:
        debugPrint("Internal Server Error: ${response.data}");
        throw Exception("Internal Server Error");

      default:
        debugPrint("Unhandled status code ${response.statusCode}: ${response.data}");
        throw Exception("Unhandled status code: ${response.statusCode}");
    }
  }


  static exceptionHandler(DioException exception) {
    if (exception.response != null) {
      debugPrint("DioError with response: ${exception.response?.statusCode} - ${exception.response?.data}");
    } else {
      debugPrint("DioError without response: ${exception.message}");
    }
  }


}