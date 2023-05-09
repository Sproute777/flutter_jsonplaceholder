import 'dart:async';
import 'dart:convert';

import 'package:database_client/database_client.dart';
import 'package:json_api_client/json_api_client.dart';

import '../models/user.dart';

part 'json_storage.dart';

class JsonRepository {
  final JsonApiClient _apiClient;
  final JsonStorage _jsonStorage;
  JsonRepository(JsonApiClient apiClient, JsonStorage jsonStorage)
      : _apiClient = apiClient,
        _jsonStorage = jsonStorage;

  Future<List<User>> fetchUsers() async {
    final result = jsonDecode(await _apiClient.getUsers());
    final users = (result as List).map((json) => User.fromJson(json)).toList();
    unawaited(_jsonStorage.saveUsers(users));
    return users;
  }

  Future<User> fetchSingleUser(int id) async {
    final json = jsonDecode(await _apiClient.getUser(id));
    return User.fromJson(json);
  }

  Future<List<User>> fetchLocalUsers() async {
    final usersFullEntries = await _jsonStorage.fetchUserFullEntries();
    return usersFullEntries
        .map((u) => User.fromEntry(u.userEntry, u.addressEntry, u.companyEntry))
        .toList();
  }

  Future<void> deleteLocalUser(int userId) async {
    return _jsonStorage.deleteUser(userId);
  }
}
