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
  Future<List<Post>> fetchPosts(int userId) async {
    final queryParams = <String, String>{'userId': '$userId'};
    final uri = Uri.https(baseUrl, posts, queryParams);
    final response = await _getPosts(uri);

    try {
      final body = json.decode(response.body) as List;
      return body.map((dynamic item) {
        return Post.fromJson(item as Map<String, dynamic>);
      }).toList();
    } on Exception {
      throw JsonDeserializationException();
    }
  }

  // -----------------------------------------------------------------------------//

  Future<http.Response> _getPosts(Uri uri) async {
    http.Response response = await _httpClient
        .get(uri)
        .onError((error, stackTrace) => throw HttpException());

    if (response.statusCode != 200) {
      throw HttpRequestFailure(response.statusCode);
    }
    return response;
  }
}
