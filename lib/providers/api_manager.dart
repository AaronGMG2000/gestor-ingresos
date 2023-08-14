import 'dart:convert';
import 'dart:io';

import 'package:gestor_ingresos/models/response_model.dart';
import 'package:gestor_ingresos/utils/app_type.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  ApiManager._privateConstructor();
  static final ApiManager shared = ApiManager._privateConstructor();

  Future<ServiceResponse> request(
      {required String baseUrl,
      required String pathUrl,
      required HttpType type,
      dynamic bodyParams,
      Map<String, dynamic> uriParams = const {},
      Map<String, String> headers = const {}}) async {
    try {
      final Map<String, String> myHeaders = {'Content-Type': 'application/json', 'Accept': 'application/json'};
      myHeaders.addAll(headers);

      final uri = Uri.http(baseUrl, pathUrl).replace(queryParameters: uriParams);

      final http.Response response;

      switch (type) {
        case HttpType.get:
          response = await http.get(uri, headers: myHeaders);
          break;
        case HttpType.post:
          response = await http.post(uri, headers: myHeaders, body: jsonEncode(bodyParams));
          break;
        case HttpType.delete:
          response = await http.delete(uri, headers: myHeaders, body: jsonEncode(bodyParams));
          break;
        case HttpType.put:
          response = await http.put(uri, headers: myHeaders, body: jsonEncode(bodyParams));
          break;
        case HttpType.multipart:
          final multipartRequest = http.MultipartRequest('POST', uri);
          multipartRequest.headers.addAll(headers);
          _addMultipartData(multipartRequest, bodyParams as Map<String, dynamic>);
          final streamedResponse = await multipartRequest.send();
          response = await http.Response.fromStream(streamedResponse);
          break;
      }
      if (response.statusCode == HttpStatus.ok) {
        return ServiceResponse.success(
            response.statusCode, response.reasonPhrase, response.body.isNotEmpty ? json.decode(response.body) : '');
      }
      return ServiceResponse.success(
          response.statusCode, response.reasonPhrase, response.body.isNotEmpty ? json.decode(response.body) : '');
    } catch (e) {
      return ServiceResponse.error(HttpStatus.internalServerError, e.toString());
    }
  }

  void _addMultipartData(http.MultipartRequest multipartRequest, Map<String, dynamic> params) async {
    for (var param in params.entries) {
      if (param.key == "file" && params["file"] != null) {
        var selectedFile = await http.MultipartFile.fromPath("file", params["file"]!);
        multipartRequest.files.add(selectedFile);
        continue;
      }
      multipartRequest.fields[param.key] = param.value!;
    }
  }
}
