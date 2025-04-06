import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'apiHandler.dart';

class ApiService {
  final String appBaseUrl;
  late Dio _dioWithoutHeader;
  late Dio _dioWithHeader;

  ApiService({required this.appBaseUrl}) {
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

  //TODO: ===============GET===============
  Future<Response?> getPublic(String endpoint, {Map<String, dynamic>? queryParams}) async {
    try {
      Response response = await _dioWithoutHeader.get(endpoint, queryParameters: queryParams);
      return await ApiHandler.return200Response(response);
    } on DioException catch (e) {
      ApiHandler.exceptionHandler(e);
      return null;
    } catch (e) {
      debugPrint("Unexpected Error: $e");
      return null;
    }
  }

  Future<Response> getPrivate(String endpoint, Map<String, dynamic> queryParams) async {
    try {
      final response = await _dioWithHeader.get(endpoint, queryParameters: queryParams);
      return await ApiHandler.return200Response(response);
    } on DioException catch (e) {
      ApiHandler.exceptionHandler(e);
      rethrow; // propagate error upward instead of returning null
    } catch (e) {
      debugPrint("Unexpected Error: $e");
      throw Exception("Unexpected error occurred: $e");
    }
  }


  //TODO: ===============POST===============
  Future<Response?> postPublic(String endpoint, Map<String, String>? data) async {
    try {
      Response response = await _dioWithoutHeader.post(endpoint, data: data);
      return await ApiHandler.return200Response(response);
    } on DioException catch (e) {
      ApiHandler.exceptionHandler(e);
      return null;
    } catch (e) {
      debugPrint("Unexpected Error: $e");
      return null;
    }
  }

  Future<Response?> postPrivate(String endpoint, Map<String, String>? data) async {
    try {
      Response response = await _dioWithHeader.post(endpoint, data: data);
      return await ApiHandler.return200Response(response);
    } on DioException catch (e) {
      ApiHandler.exceptionHandler(e);
      return null;
    } catch (e) {
      debugPrint("Unexpected Error: $e");
      return null;
    }
  }

  Future<dynamic> postWithImage(String endpoint, File file, Map<String, String>? extraFields, {required String fileKey}) async {
    try {
      String fileName = file.path.split('/').last;

      FormData formData = FormData.fromMap({
        fileKey: await MultipartFile.fromFile(file.path, filename: fileName),
        ...?extraFields, // Add additional fields if provided
      });

      Response response = await _dioWithHeader.post(endpoint, data: formData);
      return await ApiHandler.return200Response(response);
    } on DioException catch (e) {
      ApiHandler.exceptionHandler(e);
      return null;
    } catch (e) {
      debugPrint("Unexpected Error: $e");
      return null;
    }
  }

  //TODO: ===============PUT===============
  Future<Response?> putPrivate(String endpoint, {Map<String, dynamic>? data, Map<String, dynamic>? queryParams}) async {
    try {
      Response response = await _dioWithoutHeader.put(endpoint, data: data, queryParameters: queryParams);
      return await ApiHandler.return200Response(response);
    } on DioException catch (e) {
      ApiHandler.exceptionHandler(e);
      return null;
    } catch (e) {
      debugPrint("Unexpected Error: $e");
      return null;
    }
  }

  Future<Response?> putPublic(String endpoint, {Map<String, dynamic>? data, Map<String, dynamic>? queryParams}) async {
    try {
      Response response = await _dioWithoutHeader.put(endpoint, data: data, queryParameters: queryParams);
      return await ApiHandler.return200Response(response);
    } on DioException catch (e) {
      ApiHandler.exceptionHandler(e);
      return null;
    } catch (e) {
      debugPrint("Unexpected Error: $e");
      return null;
    }
  }

  Future<Response?> putMultipart(
    String endpoint, {
    required Map<String, dynamic> fields,
    File? file, // optional file
    String? fileFieldName = 'file', // field name for the file
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      // Prepare multipart form data
      FormData formData = FormData.fromMap({
        ...fields,
        if (file != null) fileFieldName!: await MultipartFile.fromFile(file.path, filename: file.path.split('/').last),
      });

      Response response = await _dioWithHeader.put(endpoint, data: formData, queryParameters: queryParams);

      return await ApiHandler.return200Response(response);
    } on DioException catch (e) {
      ApiHandler.exceptionHandler(e);
      return null;
    } catch (e) {
      debugPrint("Unexpected Error: $e");
      return null;
    }
  }


  //TODO: ===============DELETE===============
  Future<Response?> deletePrivate(String endpoint, {Map<String, dynamic>? queryParams}) async {
    try {
      Response response = await _dioWithHeader.delete(endpoint, queryParameters: queryParams);

      return await ApiHandler.return200Response(response);
    } on DioException catch (e) {
      ApiHandler.exceptionHandler(e);
      return null;
    } catch (e) {
      debugPrint("Unexpected Error: $e");
      return null;
    }
  }
}
