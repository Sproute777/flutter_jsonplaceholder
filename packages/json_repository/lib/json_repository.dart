import 'dart:convert';

import 'package:json_api_client/json_api_client.dart';

import 'models/user.dart';

export 'src/json_repository.dart';

class JsonRepository {
  final JsonApiClient _apiClient;
  JsonRepository(JsonApiClient apiClient) : _apiClient = apiClient;

  Future<List<User>> fetchUsers() async {
    final result = jsonDecode(await _apiClient.getUsers());
    return (result as List).map((json) => User.fromJson(json)).toList();
  }
}
