import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:vexa/core/network/api_service.dart';
import '../../app/constants/api_endpoints.dart';

class RemoteNetwork {
  final Dio _dio;
  final ApiService _apiService;

  RemoteNetwork(this._dio, this._apiService);

  Future<Response> postRequest({
    required String url,
    required Map<String, dynamic> body,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.post(
        url,
        data: jsonEncode(body),
        options: Options(
          headers: headers ?? {'Content-Type': 'application/json'},
          responseType: ResponseType.json,
        ),
      );
      return response;
    } catch (e) {
      if (kDebugMode) {
        print("Error occurred: $e");
      }
      rethrow;
    }
  }

  Future<Response> getRequest({
    required String url,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.get(
        url,
        options: Options(
          headers: headers ?? {'Accept': 'application/json'},
        ),
      );
      return response;
    } catch (e) {
      if (kDebugMode) {
        print("Error occurred: $e");
      }
      rethrow;
    }
  }

  Future<Response> putRequest({
    required String url,
    required Map<String, dynamic> body,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.put(
        url,
        data: jsonEncode(body),
        options: Options(
          headers: headers ?? {'Content-Type': 'application/json'},
          responseType: ResponseType.json,
        ),
      );
      return response;
    } catch (e) {
      if (kDebugMode) {
        print("Error occurred: $e");
      }
      rethrow;
    }
  }

  Future<Response> deleteRequest({
    required String url,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.delete(
        url,
        options: Options(
          headers: headers ?? {'Accept': 'application/json'},
        ),
      );
      return response;
    } catch (e) {
      if (kDebugMode) {
        print("Error occurred: $e");
      }
      rethrow;
    }
  }

  Future<Response> signUp(Map<String, dynamic> requestBody) async {
    try {
      final response = await postRequest(
        url: ApiEndpoints.signUp,
        body: requestBody,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
