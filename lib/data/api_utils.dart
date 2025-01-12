import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ApiHelper {
  final String baseUrl;

  ApiHelper({required this.baseUrl});

  Map<String, String> getHeaders({String? token}) {
    return {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  Future<dynamic> get(String endpoint, {String? token}) async {
    try {
      final response = await http
          .get(Uri.parse('$baseUrl$endpoint'),
              headers: getHeaders(token: token))
          .timeout(const Duration(seconds: 10));
      return _handleResponse(response);
    } on SocketException {
      throw Exception("No Internet connection");
    } on TimeoutException {
      throw Exception("Request timeout");
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> post(String endpoint,
      {String? token, Map<String, dynamic>? body}) async {
    try {
      final response = await http
          .post(
            Uri.parse('$baseUrl$endpoint'),
            headers: getHeaders(token: token),
            body: jsonEncode(body),
          )
          .timeout(const Duration(seconds: 10));
      return _handleResponse(response);
    } on SocketException {
      throw Exception("No Internet connection");
    } on TimeoutException {
      throw Exception("Request timeout");
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> put(String endpoint,
      {String? token, Map<String, dynamic>? body}) async {
    try {
      final response = await http
          .put(
            Uri.parse('$baseUrl$endpoint'),
            headers: getHeaders(token: token),
            body: jsonEncode(body),
          )
          .timeout(const Duration(seconds: 10));
      return _handleResponse(response);
    } on SocketException {
      throw Exception("No Internet connection");
    } on TimeoutException {
      throw Exception("Request timeout");
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> delete(String endpoint, {String? token}) async {
    try {
      final response = await http
          .delete(
            Uri.parse('$baseUrl$endpoint'),
            headers: getHeaders(token: token),
          )
          .timeout(const Duration(seconds: 10));
      return _handleResponse(response);
    } on SocketException {
      throw Exception("No Internet connection");
    } on TimeoutException {
      throw Exception("Request timeout");
    } catch (e) {
      rethrow;
    }
  }

  dynamic _handleResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return jsonDecode(response.body);
      case 400:
        throw Exception("Bad Request: ${response.body}");
      case 401:
        throw Exception("Unauthorized: ${response.body}");
      case 403:
        throw Exception("Forbidden: ${response.body}");
      case 404:
        throw Exception("Not Found: ${response.body}");
      case 500:
        throw Exception("Internal Server Error: ${response.body}");
      default:
        throw Exception(
            "Unexpected Error: ${response.statusCode} - ${response.body}");
    }
  }
}
