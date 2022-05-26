import 'dart:convert';
import 'package:http/http.dart' as http;
import 'endpoints.dart';

import '../models/models.dart';

class HttpException implements Exception {}

class HttpRequestFailure implements Exception {
  const HttpRequestFailure(this.statusCode);
  final int statusCode;
}

class JsonDecodeException implements Exception {}

class JsonDeserializationException implements Exception {}

class JsonplaceholderApiClient {
  JsonplaceholderApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;

  Future<List<ProfileUser>> fetchUsers() async {
    // final queryParams = <String, String>{};
    final uri = Uri.https(
      baseUrl, users,
      // queryParams
    );
    return _getUsers(uri);
  }

// 200 штук ,может быть грузить порциями
  Future<List<Todo>> fetchTodos() async {
    // final queryParams = <String, String>{};
    final uri = Uri.https(baseUrl, todos);
    return _getTodos(uri);
  }

  // 5000
  Future<List<Photo>> fetchPhotos(int albumId,
      {int startIndex = 0, int limit = 20}) async {
    final queryParams = <String, String>{
      'albumId': '$albumId',
      '_start': '$startIndex',
      '_limit': '$limit'
    };
    final uri = Uri.https(baseUrl, photos, queryParams);
    return _getPhotos(uri);
  }

  // 100
  Future<List<Album>> fetchAlbums(int userId) async {
    final queryParams = <String, String>{
      'userId': '$userId',
    };
    final uri = Uri.https(baseUrl, albums, queryParams);
    return _getAlbums(uri);
  }

  // 80 huge text in title
  Future<List<Post>> fetchPosts() async {
    // final queryParams = <String, String>{};
    final uri = Uri.https(baseUrl, posts);
    return _getPosts(uri);
  }

  // 500 large texts
  Future<List<Comment>> fetchComments() async {
    // final queryParams = <String, String>{};
    final uri = Uri.https(baseUrl, comments);
    return _getComments(uri);
  }

// -----------------------------------------------------------------------------//
  Future<List<ProfileUser>> _getUsers(Uri uri) async {
    http.Response response = await _httpClient
        .get(uri)
        .onError((error, stackTrace) => throw HttpException());

    if (response.statusCode != 200) {
      throw HttpRequestFailure(response.statusCode);
    }

    List body;
    try {
      body = json.decode(response.body) as List;
    } catch (_) {
      throw JsonDecodeException();
    }

    try {
      return body.map((dynamic item) {
        final user = User.fromJson(item as Map<String, dynamic>);
        item['company']['userId'] = user.id;
        item['address']['userId'] = user.id;
        item['address']['lng'] = item['address']['geo']['lng'];
        item['address']['lat'] = item['address']['geo']['lat'];

        final company =
            Company.fromJson(item['company'] as Map<String, dynamic>);
        final address =
            Address.fromJson(item['address'] as Map<String, dynamic>);

        return ProfileUser(user: user, address: address, company: company);
      }).toList();
    } catch (_) {
      throw JsonDeserializationException();
    }
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
// -----------------------------------------------------------------------------//

  Future<List<Photo>> _getPhotos(Uri uri) async {
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
          .map((dynamic item) => Photo.fromJson(item as Map<String, dynamic>))
          .toList();
    } on Exception {
      throw JsonDeserializationException();
    }
  }
// -----------------------------------------------------------------------------//

  Future<List<Album>> _getAlbums(Uri uri) async {
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
          .map((dynamic item) => Album.fromJson(item as Map<String, dynamic>))
          .toList();
    } on Exception {
      throw JsonDeserializationException();
    }
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
// -----------------------------------------------------------------------------//

  Future<List<Comment>> _getComments(Uri uri) async {
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
          .map((dynamic item) => Comment.fromJson(item as Map<String, dynamic>))
          .toList();
    } on Exception {
      throw JsonDeserializationException();
    }
  }
// -----------------------------------------------------------------------------//

}
