
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiService {
  final String appBaseUrl;
  late Dio _dioWithoutHeader;
  late Dio _dioWithHeader;

  ApiService({required this.appBaseUrl}){
    _dioWithoutHeader = Dio(
      BaseOptions(
        baseUrl: appBaseUrl, // Set your base URL
        connectTimeout: const Duration(seconds: 30), // Connection timeout
        receiveTimeout: const Duration(seconds: 30), // Response timeout
      ),
    );

    _dioWithHeader = Dio(
      BaseOptions(
        baseUrl: appBaseUrl, // Set your base URL
        connectTimeout: const Duration(seconds: 30), // Connection timeout
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          "Authorization": "Bearer YOUR_ACCESS_TOKEN", // Global token
          "Content-Type": "application/json",
        },
      ),
    );
  }


  Future<Response?> getPublic(String endpoint, {Map<String, dynamic>? queryParams}) async {
    try {
      Response response = await _dioWithoutHeader.get(endpoint, queryParameters: queryParams);
      return response;
    } catch (e) {
      debugPrint("GET API Error: $e");
      return null;
    }
  }

  Future<Response?> getPrivate(String endpoint, {Map<String, dynamic>? queryParams}) async {
    try {
      Response response = await _dioWithHeader.get(endpoint, queryParameters: queryParams);
      return response;
    } catch (e) {
      debugPrint("GET API Error: $e");
      return null;
    }
  }



  Future<Response?> postPublic(String endpoint, Map<String, String>? data) async {
    try {
      Response response = await _dioWithoutHeader.post(
        endpoint,
        data: data,
      );
      return response.data;
    } catch (e) {
      debugPrint("POST API Error: $e");
      return null;
    }
  }

  Future<Response?> postPrivate(String endpoint, Map<String, String>? data) async {
    try {
      Response response = await _dioWithHeader.post(
        endpoint,
        data: data,
      );
      return response.data;
    } catch (e) {
      debugPrint("POST API Error: $e");
      return null;
    }
  }

  Future<dynamic> postWithImage(String endpoint, File file, Map<String, String>? extraFields,{required String fileKey}) async {
    try {
      String fileName = file.path.split('/').last;

      FormData formData = FormData.fromMap({
        fileKey: await MultipartFile.fromFile(file.path, filename: fileName),
        ...?extraFields, // Add additional fields if provided
      });

      Response response = await _dioWithHeader.post(
        endpoint,
        data: formData,
      );

      return response.data;
    } catch (e) {
      debugPrint("File Upload Error: $e");
      return null;
    }
  }




}