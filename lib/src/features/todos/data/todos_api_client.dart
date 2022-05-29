import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../common/models/models.dart';
import '../../../common/constants/http_endpoints.dart';
import '../../../common/utils/http_errors.dart';

class TodosApiClient {
  TodosApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;

// 200 штук ,может быть грузить порциями
  Future<List<Todo>> fetchTodos() async {
    // final queryParams = <String, String>{};
    final uri = Uri.https(baseUrl, todos);
    return _getTodos(uri);
  }

  // -----------------------------------------------------------------------------//

  Future<List<Todo>> _getTodos(Uri uri) async {
    http.Response response = await _httpClient
        .get(uri)
        .onError((error, stackTrace) => throw HttpException());

    if (response.statusCode != 200) {
      throw HttpRequestFailure(response.statusCode);
    }
    List body;

    try {
      body = json.decode(response.body) as List;
    } on Exception {
      throw JsonDecodeException();
    }

    try {
      return body
          .map((dynamic item) => Todo.fromJson(item as Map<String, dynamic>))
          .toList();
    } on Exception {
      throw JsonDeserializationException();
    }
  }
}
