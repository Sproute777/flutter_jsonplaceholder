import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../core/models/models.dart';
import '../../../core/constants/http_endpoints.dart';
import '../../../core/utils/http_errors.dart';

class PostsApiClient {
  PostsApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;

// 200 штук ,может быть грузить порциями
  Future<List<Post>> fetchPosts() async {
    // final queryParams = <String, String>{};
    final uri = Uri.https(baseUrl, todos);
    return _getPosts(uri);
  }

  // -----------------------------------------------------------------------------//

  Future<List<Post>> _getPosts(Uri uri) async {
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
          .map((dynamic item) => Post.fromJson(item as Map<String, dynamic>))
          .toList();
    } on Exception {
      throw JsonDeserializationException();
    }
  }
}
